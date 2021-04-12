require "test_helper"

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should show customer" do
    ## difference between api_v1-customer_url and customerS_url !!!!
    get api_v1_customer_url(@customer), as: :json
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @customer.name, json_response['name']
    assert_equal @customer.firstname, json_response['firstname']
    assert_equal @customer.lastname, json_response['lastname']
    assert_equal @customer.address, json_response['address']
    assert_equal @customer.zipcode, json_response['zipcode']
    assert_equal @customer.vatid, json_response['vatid']
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
          name: @customer.name,
          firstname: @customer.firstname,
          lastname: @customer.lastname,
          address: @customer.address,
          zipcode: @customer.zipcode,
          vatid: @customer.vatid
        }
      }, headers: { Authorization: JsonWebToken.encode(user_id: @customer.user_id)}, as: :json
    end
    assert_response :created
  end

  test "should forbid create customer" do
    assert_no_difference('Customer.count') do
      post api_v1_customers_url, params: {
        customer: {
          name: @customer.name, fistname: @customer.firstname, lastname: @customer.lastname, address: @customer.address, zipcode: @customer.zipcode, vatid: @customer.vatid
        }
      }, as: :json
    end
  end

  test "should show customers" do
    # request.env['Authorization'] = JsonWebToken.encode(user_id: @customer.user_id)
    get api_v1_customers_url,  as: :json
    assert_response :success
  end

end
