require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def assert_unauthenticated
    assert_text "You need to sign in or sign up before continuing."
  end

  def assert_not_found
    assert_text "The page you were looking for doesn't exist."
  end
end
