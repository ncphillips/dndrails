require "application_system_test_case"

class IndexPlayerInvitesTest < ApplicationSystemTestCase
  test "you can see player invites the campaign" do
    the_campaign = campaigns(:curse_of_strahd)
    the_campaign.player_invites.create!(email: Faker::Internet.email, invited_by: the_campaign.owner)
    sign_in the_campaign.owner

    visit campaign_player_invites_url(the_campaign)

    the_campaign.player_invites.each do |player_invite|
      assert_text player_invite.email
    end
  end

  test "you don't see player invites for other campaigns" do
    the_campaign = campaigns(:curse_of_strahd)
    other_campaign = campaigns(:mountain_of_madness)
    other_campaign.player_invites.create!(email: Faker::Internet.email, invited_by: other_campaign.owner)

    sign_in the_campaign.owner

    visit campaign_player_invites_url(the_campaign)

    other_campaign.player_invites.each do |player_invite|
      refute_text player_invite.email
    end
  end
end
