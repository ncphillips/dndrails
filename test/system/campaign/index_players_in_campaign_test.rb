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
end
