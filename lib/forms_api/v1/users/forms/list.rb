# frozen_string_literal: true

class FormsAPI::V1::Users::Forms::List < FormsAPI::Client
  attr_reader :user_id, :organization_ids, :query, :page

  def initialize(user_id: nil, organization_ids: nil, query: nil, page: nil)
    @user_id = user_id
    @organization_ids = organization_ids
    @query = query
    @page = page
  end

  private

  def url
    "#{forms_api_url}/api/v1/users/#{user_id}/forms"
  end

  def payload
    {
      organization_ids:,
      query:,
      page:
    }
  end
end
