require "application_system_test_case"

class IndexPlayersInCampaignsTest < ApplicationSystemTestCase
  test "brent can see players in his campaign" do
    sign_in users(:brent)
    the_campaign = campaigns(:curse_of_strahd)

    the_campaign.players.create!(user: users(:evan))

    visit campaign_url(the_campaign)

    the_campaign.players.each do |player|
      assert_text player.user.name
    end
  end
  test "when a player is added to a campaign" do
    the_campaign = campaigns(:curse_of_strahd)
    sign_in the_campaign.owner

    visit campaign_url(the_campaign)
    assert_no_text users(:evan).name

    the_campaign.players.create!(user: users(:evan))
    assert_text users(:evan).name
  end
end
