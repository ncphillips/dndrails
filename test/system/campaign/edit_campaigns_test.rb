require "application_system_test_case"

class EditCampaignsTest < ApplicationSystemTestCase
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

  test "it's not found if I try to edit a campaign I'm not a part of" do
    sign_in users(:brent)
    campaigns = campaigns(:mountain_of_madness)
    visit campaign_url(campaigns)

    refute_link "Edit"

    visit edit_campaign_url(campaigns)

    assert_not_found
  end

  test "logged out user can't edit a campaign" do
    visit campaign_url(campaigns(:curse_of_strahd))

    refute_link "Edit"

    visit edit_campaign_url(campaigns(:curse_of_strahd))

    assert_unauthenticated
  end
end
