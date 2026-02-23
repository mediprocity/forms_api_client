# frozen_string_literal: true

require 'json'
require 'openssl'
require 'rest-client'

class FormsAPI::Client
  MAX_RETRY_COUNT = 3
  TIMEOUT = 10

  def call
    with_retry { { code:, body: } }
  end

  private

  def method
    :get
  end

  def response
    @response ||= RestClient::Request.execute(method:, url:, payload:, headers:, timeout: TIMEOUT)
  rescue RestClient::UnprocessableEntity, RestClient::BadRequest, RestClient::Unauthorized, RestClient::NotFound => e
    @response ||= e.response
  end

  def code
    @code ||= response.code
  end

  def body
    @body ||= JSON.parse(response.body)
  end

  def payload
    {}
  end

  def headers
    timestamp = Time.now.to_i.to_s
    data_to_sign = "#{timestamp}:#{url}"
    signature = OpenSSL::HMAC.hexdigest('SHA256', access_token, data_to_sign)
    { 'Access-Timestamp' => timestamp, 'Access-Signature' => signature }
  end

  def access_token
    ENV.fetch('FORMS_API_ACCESS_TOKEN')
  end

  def forms_api_url
    ENV.fetch('FORMS_API_URL')
  end

  def with_retry
    retries ||= 0
    yield
  rescue RestClient::RequestFailed, RestClient::ServerBrokeConnection, RestClient::Exceptions::Timeout
    retry if (retries += 1) < MAX_RETRY_COUNT
    raise
  end
end
