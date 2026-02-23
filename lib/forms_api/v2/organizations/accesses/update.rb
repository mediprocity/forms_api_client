# frozen_string_literal: true

class FormsAPI::V2::Organizations::Accesses::Update < FormsAPI::Client
  attr_reader :organization_id, :user_id, :params

  def initialize(organization_id: nil, user_id: nil, params: nil)
    @organization_id = organization_id
    @user_id = user_id
    @params = params
  end

  private

  def method
    :put
  end

  def url
    "#{forms_api_url}/api/v2/organizations/#{organization_id}/accesses/#{user_id}"
  end

  def payload
    {
      access: {
        forms_access: params.forms_access,
        dashboard_access: params.dashboard_access,
        metrics_access: params.metrics_access,
        reports_access: params.reports_access
      }
    }
  end
end
