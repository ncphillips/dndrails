require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def assert_unauthenticated
    assert_text "You need to sign in or sign up before continuing."
  end
end
