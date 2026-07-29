# frozen_string_literal: true

class FormsAPI::V2::Organizations::Accesses::Update < FormsAPI::Client
  attr_reader :organization_id, :user_id, :params, :actor_id, :user_full_name

  def initialize(organization_id: nil, user_id: nil, params: nil, actor_id: nil, user_full_name: nil)
    @organization_id = organization_id
    @user_id = user_id
    @params = params
    @actor_id = actor_id
    @user_full_name = user_full_name
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
      },
      actor_id:,
      user: {
        full_name: user_full_name
      }
    }
  end
end
