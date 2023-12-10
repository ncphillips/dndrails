require "application_system_test_case"

class NewPlayerInvitesTest < ApplicationSystemTestCase
  test "sending an invite" do
    the_campaign = campaigns(:curse_of_strahd)
    sign_in the_campaign.owner

    visit new_campaign_player_invite_url(the_campaign)

    email = Faker::Internet.email

    fill_in "Email", with: email
    click_on "Send Invite"

    assert_text "Invite sent to #{email}"
  end
end