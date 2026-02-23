# frozen_string_literal: true

class FormsAPI::V1::Forms::Get < FormsAPI::Client
  attr_reader :id

  def initialize(id: nil)
    @id = id
  end

  private

  def url
    "#{forms_api_url}/api/v1/forms/#{id}"
  end
end
