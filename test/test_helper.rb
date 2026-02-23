require 'json'
require 'minitest/autorun'
require 'ostruct'

require_relative '../lib/forms_api_client'

class FormsAPIServiceTest < Minitest::Test
  BASE_URL = 'https://forms-api.example.com'
  ACCESS_TOKEN = 'test-access-token'

  FakeResponse = Struct.new(:code, :body)

  def setup
    ENV['FORMS_API_URL'] = BASE_URL
    ENV['FORMS_API_ACCESS_TOKEN'] = ACCESS_TOKEN
  end

  private

  def assert_service_call(service_class:, kwargs:, expected_method:, expected_url:, expected_payload:, response_code:, response_body:)
    captured_request = nil
    fake_response = FakeResponse.new(response_code, JSON.dump(response_body))
    request_singleton = RestClient::Request.singleton_class
    original_execute = RestClient::Request.method(:execute)

    request_singleton.send(:define_method, :execute, lambda { |**request_kwargs|
      captured_request = request_kwargs
      fake_response
    })

    begin
      result = service_class.new(**kwargs).call
      assert_equal(response_code, result[:code])
      assert_equal(response_body, result[:body])
    ensure
      request_singleton.send(:define_method, :execute, original_execute)
    end

    refute_nil(captured_request)
    assert_equal(expected_method, captured_request[:method])
    assert_equal(expected_url, captured_request[:url])
    assert_equal(expected_payload, captured_request[:payload])
    assert_equal(FormsAPI::Client::TIMEOUT, captured_request[:timeout])
    assert(captured_request[:headers].key?('Access-Timestamp'))
    assert(captured_request[:headers].key?('Access-Signature'))
  end
end
