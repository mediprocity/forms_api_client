# frozen_string_literal: true

class FormsAPI::V1::Forms::List < FormsAPI::Client
  attr_reader :form_ids

  def initialize(form_ids: nil)
    @form_ids = form_ids
  end

  private

  def url
    "#{forms_api_url}/api/v1/forms"
  end

  def payload
    {
      form_ids:
    }
  end
end
