# frozen_string_literal: true

class FormsAPI::FormParticipants::List < FormsAPI::Client
  def initialize(**_unused)
  end

  private

  def url
    "#{forms_api_url}/api/form_participants"
  end
end
