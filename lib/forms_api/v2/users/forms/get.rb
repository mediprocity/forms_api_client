# frozen_string_literal: true

class FormsAPI::V2::Users::Forms::Get < FormsAPI::Client
  attr_reader :user_id, :id, :organization_ids

  def initialize(user_id: nil, id: nil, organization_ids: nil)
    @user_id = user_id
    @id = id
    @organization_ids = organization_ids
  end

  private

  def url
    "#{forms_api_url}/api/v2/users/#{user_id}/forms/#{id}"
  end

  def payload
    {
      organization_ids:
    }
  end
end
