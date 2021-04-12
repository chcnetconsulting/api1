require "test_helper"

class Api::V1::CustomerControllerTest < ActionDispatch::IntegrationTest

  setup do
    @customer = customers(:one)
  end

  test "should show customer" do
    get api_v1_customer_url(@customer), as: :as_json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @customer.name, json_response['name']
  end
end
