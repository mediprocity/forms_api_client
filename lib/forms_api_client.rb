# frozen_string_literal: true

module FormsAPI
  module FormParticipants; end
  module Metrics; end

  module V1
    module Forms; end

    module Users
      module Forms; end
    end

    module Organizations
      module Forms; end
    end
  end

  module V2
    module Forms; end

    module Users
      module Forms; end
    end

    module Organizations
      module Accesses; end
      module Forms; end
    end
  end
end

require_relative 'forms_api/client'
require_relative 'forms_api/form_participants/list'
require_relative 'forms_api/metrics/get'
require_relative 'forms_api/metrics/list'
require_relative 'forms_api/v1/forms/get'
require_relative 'forms_api/v1/forms/list'
require_relative 'forms_api/v1/organizations/forms/get'
require_relative 'forms_api/v1/organizations/forms/list'
require_relative 'forms_api/v1/users/forms/list'
require_relative 'forms_api/v2/forms/get'
require_relative 'forms_api/v2/forms/list'
require_relative 'forms_api/v2/organizations/accesses/list'
require_relative 'forms_api/v2/organizations/accesses/update'
require_relative 'forms_api/v2/organizations/forms/create'
require_relative 'forms_api/v2/organizations/forms/list'
require_relative 'forms_api/v2/users/forms/get'
require_relative 'forms_api/v2/users/forms/list'
