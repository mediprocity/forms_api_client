# frozen_string_literal: true

class FormsAPI::V2::Forms::Get < FormsAPI::Client
  attr_reader :id, :view

  def initialize(id: nil, view: nil)
    @id = id
    @view = view
  end

  private

  def url
    "#{forms_api_url}/api/v2/forms/#{id}"
  end

  def payload
    {
      view:
    }
  end
end
