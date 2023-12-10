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

  test "you don't see player invites for other campaigns" do
    the_campaign = campaigns(:curse_of_strahd)
    other_campaign = campaigns(:mountain_of_madness)
    other_campaign.player_invites.create!(email: "somethign@example.com", invited_by: other_campaign.owner)

    sign_in the_campaign.owner

    visit campaign_player_invites_url(the_campaign)

    other_campaign.player_invites.each do |player_invite|
      refute_text player_invite.email
    end
  end
end
