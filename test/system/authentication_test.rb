require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "signing up" do
    visit new_user_registration_url

    fill_in "Name", with: "William the Conqueror"
    fill_in "Email", with: "william@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Sign up"
  end
end
