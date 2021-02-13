require "application_system_test_case"

class UrlShortsTest < ApplicationSystemTestCase
  setup do
    @url_short = url_shorts(:one)
  end

  test "visiting the index" do
    visit url_shorts_url
    assert_selector "h1", text: "Url Shorts"
  end

  test "creating a Url short" do
    visit url_shorts_url
    click_on "New Url Short"

    fill_in "Link", with: @url_short.link
    click_on "Create Url short"

    assert_text "Url short was successfully created"
    click_on "Back"
  end

  test "updating a Url short" do
    visit url_shorts_url
    click_on "Edit", match: :first

    fill_in "Link", with: @url_short.link
    click_on "Update Url short"

    assert_text "Url short was successfully updated"
    click_on "Back"
  end

  test "destroying a Url short" do
    visit url_shorts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Url short was successfully destroyed"
  end
end
