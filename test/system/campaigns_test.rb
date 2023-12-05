require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit campaigns_url

    assert_selector "h1", text: "Campaigns"
  end

  test "viewing a campaign" do
    visit campaign_url(campaigns(:one))

    assert_selector "h1", text: campaigns(:one).title
  end
end
