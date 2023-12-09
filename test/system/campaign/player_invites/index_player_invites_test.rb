require "application_system_test_case"

class IndexPlayerInvitesTest < ApplicationSystemTestCase
  test "brent can see player invites for his campaign" do
    brent = users(:brent)
    sign_in brent
    the_campaign = campaigns(:curse_of_strahd)

    email = "whatwhat@example.com"
    the_campaign.player_invites.create!(email:, invited_by: brent)

    visit campaign_player_invites_url(the_campaign)

    the_campaign.player_invites.each do |player_invite|
      assert_text player_invite.email
    end
  end
end
