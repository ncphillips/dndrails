require "application_system_test_case"

class IndexPlayerInvitesTest < ApplicationSystemTestCase
  test "logged out users can't see player invites" do
    the_campaign = campaigns(:curse_of_strahd)

    visit campaign_player_invites_url(the_campaign)

    assert_unauthenticated
  end

  test "it is not found when I try to see invites to campaigns I'm not a part of" do
    the_campaign = campaigns(:curse_of_strahd)
    the_campaign.player_invites.create!(email: Faker::Internet.email, invited_by: the_campaign.owner)
    sign_in User.create(email: Faker::Internet.email, password: "password", confirmed_at: Time.now - 1.day)

    visit campaign_player_invites_url(the_campaign)

    assert_not_found
  end

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
