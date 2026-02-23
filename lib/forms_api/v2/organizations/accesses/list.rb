# frozen_string_literal: true

class FormsAPI::V2::Organizations::Accesses::List < FormsAPI::Client
  attr_reader :organization_id, :user_ids

  def initialize(organization_id: nil, user_ids: nil)
    @organization_id = organization_id
    @user_ids = user_ids
  end

  private

  def url
    "#{forms_api_url}/api/v2/organizations/#{organization_id}/accesses"
  end

  def payload
    {
      user_ids:
    }
  end
end
