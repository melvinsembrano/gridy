require "test_helper"

class Gridy::Controller::ActionsIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: {
        account: {
          email: "newuser@test.com", first_name: "New", last_name: "User",
          birthday: "2020-01-01", company: "New Company", position: "New Position"
        }
      }
    end

    assert_redirected_to account_url(Account.last)
  end

end
