# frozen_string_literal: true

require_relative 'test_helper'

class ServicesTest < FormsAPIServiceTest
  def test_form_participants_list
    assert_service_call(
      service_class: FormsAPI::FormParticipants::List,
      kwargs: {},
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/form_participants",
      expected_payload: {},
      response_code: 200,
      response_body: { 'participants' => ['a@example.com'] }
    )
  end

  def test_metrics_list
    assert_service_call(
      service_class: FormsAPI::Metrics::List,
      kwargs: { organization_ids: [1, 3], start_at: nil, end_at: nil },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/metrics",
      expected_payload: { organization_ids: [1, 3], start_at: nil, end_at: nil },
      response_code: 200,
      response_body: [{ 'label' => 'Completed', 'type' => 'completed', 'total' => 15 }]
    )
  end

  def test_metrics_get
    assert_service_call(
      service_class: FormsAPI::Metrics::Get,
      kwargs: { type: 'completed', organization_ids: [1, 3], start_at: nil, end_at: nil, page: 1 },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/metrics/completed",
      expected_payload: { organization_ids: [1, 3], start_at: nil, end_at: nil, page: 1 },
      response_code: 200,
      response_body: { 'meta' => { 'count' => 1 }, 'metrics' => [{ 'id' => 'form-1', 'count' => 7 }] }
    )
  end

  def test_metrics_get_invalid_type
    assert_service_call(
      service_class: FormsAPI::Metrics::Get,
      kwargs: { type: 'invalid', organization_ids: [1, 3], start_at: nil, end_at: nil, page: 1 },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/metrics/invalid",
      expected_payload: { organization_ids: [1, 3], start_at: nil, end_at: nil, page: 1 },
      response_code: 400,
      response_body: { 'message' => 'invalid is not a valid type' }
    )
  end

  def test_v1_forms_get
    form_id = 'fa9acaf3-9373-4e03-9e7f-d7c1e937c555'

    assert_service_call(
      service_class: FormsAPI::V1::Forms::Get,
      kwargs: { id: form_id },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v1/forms/#{form_id}",
      expected_payload: {},
      response_code: 200,
      response_body: { 'id' => form_id, 'name' => 'Form', 'url' => 'http://example.test/forms/1' }
    )
  end

  def test_v1_forms_list
    form_ids = ['fa9acaf3-9373-4e03-9e7f-d7c1e937c555']

    assert_service_call(
      service_class: FormsAPI::V1::Forms::List,
      kwargs: { form_ids: },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v1/forms",
      expected_payload: { form_ids: },
      response_code: 200,
      response_body: [{ 'id' => form_ids.first, 'name' => 'Form', 'url' => 'http://example.test/forms/1' }]
    )
  end

  def test_v1_organizations_forms_get
    form_id = 'fa9acaf3-9373-4e03-9e7f-d7c1e937c555'

    assert_service_call(
      service_class: FormsAPI::V1::Organizations::Forms::Get,
      kwargs: { organization_id: 1, id: form_id },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v1/organizations/1/forms/#{form_id}",
      expected_payload: {},
      response_code: 200,
      response_body: { 'id' => form_id, 'name' => 'Form', 'url' => 'http://example.test/forms/1' }
    )
  end

  def test_v1_organizations_forms_list
    assert_service_call(
      service_class: FormsAPI::V1::Organizations::Forms::List,
      kwargs: { organization_id: 1, page: 1 },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v1/organizations/1/forms",
      expected_payload: { page: 1 },
      response_code: 200,
      response_body: { 'forms' => [{ 'id' => 'f1', 'name' => 'Form', 'url' => 'http://example.test/forms/1' }], 'total_count' => 3 }
    )
  end

  def test_v1_users_forms_list
    user_id = 'd16f06e8-a1cf-42dd-8d8c-0637fc2d6386'

    assert_service_call(
      service_class: FormsAPI::V1::Users::Forms::List,
      kwargs: { user_id:, organization_ids: [1], query: '', page: 1 },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v1/users/#{user_id}/forms",
      expected_payload: { organization_ids: [1], query: '', page: 1 },
      response_code: 200,
      response_body: { 'forms' => [{ 'id' => 'f1', 'name' => 'Form', 'url' => 'http://example.test/forms/1' }], 'total_count' => 3 }
    )
  end

  def test_v2_forms_get
    form_id = 'fa9acaf3-9373-4e03-9e7f-d7c1e937c555'

    assert_service_call(
      service_class: FormsAPI::V2::Forms::Get,
      kwargs: { id: form_id, view: :main },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v2/forms/#{form_id}",
      expected_payload: { view: :main },
      response_code: 200,
      response_body: { 'id' => form_id, 'title' => 'Form', 'url' => 'http://example.test/forms/1' }
    )
  end

  def test_v2_forms_list
    form_ids = ['fa9acaf3-9373-4e03-9e7f-d7c1e937c555', 'fa9acaf3-9373-4e03-9e7f-d7c1e937c556']

    assert_service_call(
      service_class: FormsAPI::V2::Forms::List,
      kwargs: { form_ids:, view: :short },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v2/forms",
      expected_payload: { form_ids:, view: :short },
      response_code: 200,
      response_body: [{ 'id' => form_ids.first, 'title' => 'Form', 'url' => 'http://example.test/forms/1' }]
    )
  end

  def test_v2_users_forms_get
    user_id = 'd16f06e8-a1cf-42dd-8d8c-0637fc2d6386'
    form_id = 'fa9acaf3-9373-4e03-9e7f-d7c1e937c555'

    assert_service_call(
      service_class: FormsAPI::V2::Users::Forms::Get,
      kwargs: { user_id:, organization_ids: [1], id: form_id },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v2/users/#{user_id}/forms/#{form_id}",
      expected_payload: { organization_ids: [1] },
      response_code: 200,
      response_body: { 'id' => form_id, 'title' => 'Form', 'url' => 'http://example.test/forms/1' }
    )
  end

  def test_v2_users_forms_list
    user_id = 'd16f06e8-a1cf-42dd-8d8c-0637fc2d6386'

    assert_service_call(
      service_class: FormsAPI::V2::Users::Forms::List,
      kwargs: { user_id:, organization_ids: [1], query: '', page: 1 },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v2/users/#{user_id}/forms",
      expected_payload: { organization_ids: [1], query: '', page: 1 },
      response_code: 200,
      response_body: { 'forms' => [{ 'id' => 'f1', 'title' => 'Form', 'url' => 'http://example.test/forms/1' }], 'meta' => { 'count' => 3 } }
    )
  end

  def test_v2_organizations_forms_list
    assert_service_call(
      service_class: FormsAPI::V2::Organizations::Forms::List,
      kwargs: { organization_id: 1, query: nil, page: 1, not_assigned: false },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v2/organizations/1/forms",
      expected_payload: { query: nil, page: 1, not_assigned: false },
      response_code: 200,
      response_body: { 'forms' => [{ 'id' => 'f1', 'title' => 'Form', 'url' => 'http://example.test/forms/1' }], 'meta' => { 'count' => 3 } }
    )
  end

  def test_v2_organizations_forms_create
    forms = [{ id: 'fa9acaf3-9373-4e03-9e7f-d7c1e937c555', delete: false }]

    assert_service_call(
      service_class: FormsAPI::V2::Organizations::Forms::Create,
      kwargs: { organization_id: 1, forms: },
      expected_method: :post,
      expected_url: "#{BASE_URL}/api/v2/organizations/1/forms",
      expected_payload: { organization: { forms: } },
      response_code: 201,
      response_body: { 'forms' => [{ 'id' => 'f1', 'title' => 'Form', 'url' => 'http://example.test/forms/1' }], 'meta' => { 'count' => 1 } }
    )
  end

  def test_v2_organizations_accesses_list
    user_ids = ['3b3eb978-67ce-4991-b827-6ba3ef865101']

    assert_service_call(
      service_class: FormsAPI::V2::Organizations::Accesses::List,
      kwargs: { organization_id: 1, user_ids: },
      expected_method: :get,
      expected_url: "#{BASE_URL}/api/v2/organizations/1/accesses",
      expected_payload: { user_ids: },
      response_code: 200,
      response_body: { 'accesses' => [{ 'user_id' => user_ids.first, 'forms_access' => true }], 'meta' => { 'count' => 1 } }
    )
  end

  def test_v2_organizations_accesses_update
    params = OpenStruct.new(
      forms_access: false,
      dashboard_access: true,
      metrics_access: true,
      reports_access: true
    )

    assert_service_call(
      service_class: FormsAPI::V2::Organizations::Accesses::Update,
      kwargs: { organization_id: 1, user_id: '3b3eb978-67ce-4991-b827-6ba3ef865101', params: },
      expected_method: :put,
      expected_url: "#{BASE_URL}/api/v2/organizations/1/accesses/3b3eb978-67ce-4991-b827-6ba3ef865101",
      expected_payload: {
        access: {
          forms_access: false,
          dashboard_access: true,
          metrics_access: true,
          reports_access: true
        }
      },
      response_code: 200,
      response_body: {
        'id' => 98,
        'organization_id' => 1,
        'user_id' => '3b3eb978-67ce-4991-b827-6ba3ef865101',
        'dashboard_access' => true,
        'forms_access' => false,
        'metrics_access' => true,
        'reports_access' => true
      }
    )
  end
end
