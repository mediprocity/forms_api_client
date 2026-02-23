# frozen_string_literal: true

class FormsAPI::Metrics::Get < FormsAPI::Client
  attr_reader :type, :organization_ids, :start_at, :end_at, :page

  def initialize(type: nil, organization_ids: nil, start_at: nil, end_at: nil, page: nil)
    @type = type
    @organization_ids = organization_ids
    @start_at = start_at
    @end_at = end_at
    @page = page
  end

  private

  def url
    "#{forms_api_url}/api/metrics/#{type}"
  end

  def payload
    {
      organization_ids:,
      start_at:,
      end_at:,
      page:
    }
  end
end
