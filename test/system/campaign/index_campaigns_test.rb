require "application_system_test_case"

class IndexCampaignsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit campaigns_url

    assert_selector "h1", text: "Campaigns"
    assert_link campaigns(:curse_of_strahd).title
  end
end
