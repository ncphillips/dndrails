require "application_system_test_case"

class IndexInvitationsTest < ApplicationSystemTestCase
  test "anonymous users cannot access the index" do
    visit invitations_url

    assert_unauthenticated
  end

  test "viewing what I've been invited too" do
    me = User.create(email: Faker::Internet.email, password: "password", confirmed_at: Time.now - 1.day)
    invitation = campaigns(:curse_of_strahd).player_invites.create(email: me.email, invited_by: users(:brent))
    sign_in me

    visit invitations_url

    assert_selector "h1", text: "Invitations"
    assert_text invitation.campaign.title
  end
end
