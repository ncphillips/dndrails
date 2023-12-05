require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit campaigns_url

    assert_selector "h1", text: "Campaigns"
    assert_link campaigns(:curse_of_strahd).title
  end

  test "viewing a campaign" do
    sign_in users(:brent)

    the_campaigns = campaigns(:curse_of_strahd)

    visit campaign_url(the_campaigns)

    assert_selector "h1", text: the_campaigns.title
    assert_text the_campaigns.owner.name
  end

  test "brent creating a campaign" do
    sign_in users(:brent)

    visit campaigns_url

    click_on "New Campaign"

    title = "The Jungle of Chult"

    fill_in "Title", with: title
    click_on "Create Campaign"

    assert_selector "h1", text: title
    assert_text "Campaign was successfully created."
  end

  test "logged out user can't create a campaign" do
    visit campaigns_url

    refute_link "New Campaign"

    assert_link "Log in"
    assert_link "Sign up"
  end

  test "brent editing a campaign" do
    sign_in users(:brent)
    visit campaign_url(campaigns(:curse_of_strahd))
    click_on "Edit"

    new_title = "Wrath of the Righteous"

    fill_in "Title", with: new_title
    click_on "Update Campaign"

    assert_selector "h1", text: new_title
    assert_text "Campaign was successfully updated."
  end

  test "logged out user can't edit a campaign" do
    visit campaign_url(campaigns(:curse_of_strahd))

    refute_link "Edit"

    visit edit_campaign_url(campaigns(:curse_of_strahd))

    assert_link "Log in"
  end

  test "brent deleting a campaign" do
    sign_in users(:brent)
    visit campaign_url(campaigns(:curse_of_strahd))
    click_on "Delete"

    assert_text "Campaign was successfully deleted."
  end

  test "logged out user can't delete a campaign" do
    visit campaign_url(campaigns(:curse_of_strahd))

    refute_button "Delete"
  end
end
