# frozen_string_literal: true

class FormsAPI::Metrics::List < FormsAPI::Client
  attr_reader :organization_ids, :start_at, :end_at

  def initialize(organization_ids: nil, start_at: nil, end_at: nil)
    @organization_ids = organization_ids
    @start_at = start_at
    @end_at = end_at
  end

  private

  def url
    "#{forms_api_url}/api/metrics"
  end

  def payload
    {
      organization_ids:,
      start_at:,
      end_at:
    }
  end
end
