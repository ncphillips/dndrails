require "application_system_test_case"

class IndexCampaignsTest < ApplicationSystemTestCase
  test "user can see their own campaigns" do
    sign_in users(:brent)

    visit campaigns_url

    assert_selector "h1", text: "Campaigns"
    assert_link campaigns(:curse_of_strahd).title
  end
end
