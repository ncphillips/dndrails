require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def login_as(user)
    visit new_user_session_url
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end
end
