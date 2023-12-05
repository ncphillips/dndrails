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
end
