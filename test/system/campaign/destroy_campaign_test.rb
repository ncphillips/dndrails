require "application_system_test_case"

class DestroyCampaignsTest < ApplicationSystemTestCase
  test "brent deleting a campaign" do
    sign_in users(:brent)
    visit campaign_url(campaigns(:curse_of_strahd))
    click_on "Delete"

    assert_text "Campaign was successfully deleted."
  end

  test "people can't delete other people's campaigns" do
    sign_in users(:brent)
    campaigns = campaigns(:mountain_of_madness)
    visit campaign_url(campaigns)

    refute_button "Delete"
  end

  test "logged out user can't delete a campaign" do
    visit campaign_url(campaigns(:curse_of_strahd))

    refute_button "Delete"
  end
end
