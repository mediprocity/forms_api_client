# frozen_string_literal: true

class FormsAPI::FormParticipants::List < FormsAPI::Client
  private

  def url
    "#{forms_api_url}/api/form_participants"
  end
end
