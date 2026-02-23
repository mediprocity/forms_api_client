# frozen_string_literal: true

class FormsAPI::V1::Organizations::Forms::Get < FormsAPI::Client
  attr_reader :organization_id, :id

  def initialize(organization_id: nil, id: nil)
    @organization_id = organization_id
    @id = id
  end

  private

  def url
    "#{forms_api_url}/api/v1/organizations/#{organization_id}/forms/#{id}"
  end
end
