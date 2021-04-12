require "test_helper"

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should show customer" do
    get api_v1_customers_url(@customer), as: :as_json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @customer.name, json_response['name']
  end

  test "should have valid data" do
    customer = customers(:one)
    customer.name = nil
    customer.firstname = nil
    customer.lastname = nil
    customer.address = nil
    customer.zipcode = nil
    assert_not customer.valid?
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post api_v1_customers_url, params: {
        customer: {
          name: @customer.name, fistname: @customer.firstname, lastname: @customer.lastname, address: @customer.address, zipcode: @customer.zipcode, vatid: @customer.vatid
        }
      }, headers: { Authoriztion: JsonWebToken.encode(user_id: @customer.user_id)}, as: :json
    end
    assert_response :created
  end

  test "should forbid create customer" do
    assert_no_difference('Customer.count') do
      post api_v1_customers_url, params: {
        customer: {
          name: @customer.name, fistname: @customer.firstname, lastname: @customer.lastname, address: @customer.address, zipcode: @customer.zipcode, vatid: @customer.vatid
        }
      },  as: :json
    end
  end

  test "should show customers" do
    get api_v1_customers_url, as: :json
    assert_response :success
    end
end
