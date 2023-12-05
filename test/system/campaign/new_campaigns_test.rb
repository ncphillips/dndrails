require "application_system_test_case"

class NewCampaignsTest < ApplicationSystemTestCase
  test "brent creating a campaign" do
    sign_in users(:brent)

    visit campaigns_url

    click_on "New Campaign"

    title = "The Jungle of Chult"

    fill_in "Title", with: title
    click_on "Create Campaign"

    assert_selector "h1", text: title
    assert_text "Campaign was successfully created."
  end

  test "logged out user can't create a campaign" do
    visit campaigns_url

    refute_link "New Campaign"

    assert_link "Log in"
    assert_link "Sign up"
  end
end
