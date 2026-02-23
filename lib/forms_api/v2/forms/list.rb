# frozen_string_literal: true

class FormsAPI::V2::Forms::List < FormsAPI::Client
  attr_reader :form_ids, :view

  def initialize(form_ids: nil, view: nil)
    @form_ids = form_ids
    @view = view
  end

  private

  def url
    "#{forms_api_url}/api/v2/forms"
  end

  def payload
    {
      form_ids:,
      view:
    }
  end
end
