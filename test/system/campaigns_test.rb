require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit campaigns_url

    assert_selector "h1", text: "Campaigns"
    assert_link campaigns(:curse_of_strahd).title
  end

  test "viewing a campaign" do
    visit campaign_url(campaigns(:curse_of_strahd))

    assert_selector "h1", text: campaigns(:curse_of_strahd).title
  end

  test "creating a campaign" do
    title = "The Jungle of Chult"
    visit campaigns_url
    click_on "New Campaign"

    fill_in "Title", with: title
    click_on "Create Campaign"

    assert_selector "h1", text: title
    assert_text "Campaign was successfully created."
  end

  test "editing a campaign" do
    new_title = "Wrath of the Righteous"
    visit campaign_url(campaigns(:curse_of_strahd))
    click_on "Edit"

    fill_in "Title", with: new_title
    click_on "Update Campaign"

    assert_selector "h1", text: new_title
    assert_text "Campaign was successfully updated."
  end
end
