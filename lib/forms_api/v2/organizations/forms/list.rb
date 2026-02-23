# frozen_string_literal: true

class FormsAPI::V2::Organizations::Forms::List < FormsAPI::Client
  attr_reader :organization_id, :query, :page, :not_assigned

  def initialize(organization_id: nil, query: nil, page: nil, not_assigned: nil)
    @organization_id = organization_id
    @query = query
    @page = page
    @not_assigned = not_assigned
  end

  private

  def url
    "#{forms_api_url}/api/v2/organizations/#{organization_id}/forms"
  end

  def payload
    {
      query:,
      page:,
      not_assigned:
    }
  end
end
