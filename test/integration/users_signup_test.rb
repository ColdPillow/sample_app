require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
  	get register_path
    assert_no_difference 'User.count' do
  	  post users_path, user: { name: "", 
  		                       email: "user@invalid",
  		                       password:              "foo",
  		                       password_confirmation: "bar" }

  test "valid signup information" do
  	get register_path
  	assert_difference 'User.count' do
  		post_via_redirect users_path, user: { name: "Example User",
  											  email: "user@example.com",
  											  password:                  "password",
  											  password_confirmation:     "password" }

    end
    assert_template 'users/new'
  end
end

