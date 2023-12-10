require "application_system_test_case"

class ShowCampaignTest < ApplicationSystemTestCase
  test "viewing a campaign" do
    sign_in users(:brent)

    the_campaigns = campaigns(:curse_of_strahd)

    visit campaign_url(the_campaigns)

    assert_selector "h1", text: the_campaigns.title
    assert_text the_campaigns.owner.name
  end

  test "when the campaign name changes" do
    sign_in users(:brent)
    the_campaign = campaigns(:curse_of_strahd)

    visit campaign_url(the_campaign)
    assert_selector "h1", text: the_campaign.title

    the_campaign.update!(title: "New Title")
    assert_selector "h1", text: "New Title"
  end
end
