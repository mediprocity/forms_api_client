# forms_api_client

Ruby client gem for Forms API.

## Start

This is a library gem, so there is no server/process to run.

1. Build and install the gem locally (optional):

```bash
cd forms_api_client
gem build forms_api_client.gemspec
gem install ./forms_api_client-0.1.0.gem
```

2. Configure required environment variables:

```bash
export FORMS_API_URL="https://forms-api.example.com"
export FORMS_API_ACCESS_TOKEN="your_access_token"
```

3. Quick smoke test in console:

```bash
ruby -r forms_api_client -e "p FormsAPI::FormParticipants::List.new.call"
```

## Use

Add to another app's `Gemfile`:

```ruby
gem 'forms_api_client', git: 'https://github.com/mediprocity/forms_api_client'
```

Then run:

```bash
bundle install
```

Then:

```ruby
result = FormsAPI::V2::Forms::Get.new(id: '123', view: :main).call
result[:code] # HTTP status code
result[:body] # Parsed JSON response
```

All services follow:

```ruby
FormsAPI::<Namespace>::<Service>.new(...).call
```

## Available services

### General

- `FormsAPI::FormParticipants::List.new.call`

### Metrics

- `FormsAPI::Metrics::List.new(organization_ids:, start_at:, end_at:).call`
- `FormsAPI::Metrics::Get.new(type:, organization_ids:, start_at:, end_at:, page:).call`

### V1

- `FormsAPI::V1::Forms::Get.new(id:).call`
- `FormsAPI::V1::Forms::List.new(form_ids:).call`
- `FormsAPI::V1::Users::Forms::List.new(user_id:, organization_ids:, query:, page:).call`
- `FormsAPI::V1::Organizations::Forms::List.new(organization_id:, page:).call`
- `FormsAPI::V1::Organizations::Forms::Get.new(organization_id:, id:).call`

### V2

- `FormsAPI::V2::Forms::Get.new(id:, view:).call`
- `FormsAPI::V2::Forms::List.new(form_ids:, view:).call`
- `FormsAPI::V2::Users::Forms::List.new(user_id:, organization_ids:, query:, page:).call`
- `FormsAPI::V2::Users::Forms::Get.new(user_id:, id:, organization_ids:).call`
- `FormsAPI::V2::Organizations::Forms::List.new(organization_id:, query:, page:, not_assigned:).call`
- `FormsAPI::V2::Organizations::Forms::Create.new(organization_id:, forms:).call`
- `FormsAPI::V2::Organizations::Accesses::List.new(organization_id:, user_ids:).call`
- `FormsAPI::V2::Organizations::Accesses::Update.new(organization_id:, user_id:, params:).call`

For `Accesses::Update`, `params` should respond to:

- `forms_access`
- `dashboard_access`
- `metrics_access`
- `reports_access`
