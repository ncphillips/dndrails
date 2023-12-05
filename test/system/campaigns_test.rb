require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit campaigns_url

    assert_selector "h1", text: "Campaigns"
    assert_link campaigns(:curse_of_strahd).title
  end

  test "viewing a campaign" do
    visit campaign_url(campaigns(:curse_of_strahd))

    assert_selector "h1", text: campaigns(:curse_of_strahd).title
  end
end
