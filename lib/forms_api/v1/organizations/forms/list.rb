# frozen_string_literal: true

class FormsAPI::V1::Organizations::Forms::List < FormsAPI::Client
  attr_reader :organization_id, :page

  def initialize(organization_id: nil, page: nil)
    @organization_id = organization_id
    @page = page
  end

  private

  def url
    "#{forms_api_url}/api/v1/organizations/#{organization_id}/forms"
  end

  def payload
    {
      page:
    }
  end
end
