require "application_system_test_case"

class IndexPlayerInvitesInCampaignsTest < ApplicationSystemTestCase
  test "brent can see player invites in his campaign" do
    sign_in users(:brent)
    the_campaign = campaigns(:curse_of_strahd)
    email = Faker::Internet.email

    the_campaign.player_invites.create!(email: email, invited_by: users(:brent))

    visit campaign_url(the_campaign)

    assert_text email
  end
  test "when a player is invited to a campaign" do
    the_campaign = campaigns(:curse_of_strahd)
    sign_in the_campaign.owner
    email = Faker::Internet.email

    visit campaign_url(the_campaign)
    assert_no_text email

    the_campaign.player_invites.create!(email: email, invited_by: users(:brent))
    assert_text email
  end
end
