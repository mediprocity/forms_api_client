# frozen_string_literal: true

class FormsAPI::V2::Organizations::Forms::Create < FormsAPI::Client
  attr_reader :organization_id, :forms

  def initialize(organization_id: nil, forms: nil)
    @organization_id = organization_id
    @forms = forms
  end

  private

  def method
    :post
  end

  def url
    "#{forms_api_url}/api/v2/organizations/#{organization_id}/forms"
  end

  def payload
    {
      organization: {
        forms:
      }
    }
  end
end
