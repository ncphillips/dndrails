require "application_system_test_case"

class IndexCampaignsTest < ApplicationSystemTestCase
  test "anonymous users cannot access the index" do
    visit campaigns_url

    assert_unauthenticated
  end

  test "user can see their own campaigns" do
    sign_in users(:brent)

    visit campaigns_url

    assert_selector "h1", text: "Campaigns"

    users(:brent).campaigns.each do |campaign|
      assert_link campaign.title
    end
  end

  test "users cannot see other users' campaigns" do
    sign_in users(:brent)

    visit campaigns_url

    users(:evan).campaigns.each do |campaign|
      refute_link campaign.title
    end
  end

  test "users can see campaigns they're the DM for" do
    new_user = User.create!(email: "test@example.com", password: "password", confirmed_at: Time.now)

    DungeonMaster.create user: new_user, campaign: campaigns(:curse_of_strahd)

    sign_in new_user

    visit campaigns_url

    assert_link campaigns(:curse_of_strahd).title
  end

  test "users can see campaigns they're a Player for" do
    new_user = User.create!(email: "test@example.com", password: "password", confirmed_at: Time.now)

    Player.create user: new_user, campaign: campaigns(:curse_of_strahd)

    sign_in new_user

    visit campaigns_url

    assert_link campaigns(:curse_of_strahd).title
  end
end
