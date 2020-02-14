require "application_system_test_case"

class MatchUsersTest < ApplicationSystemTestCase
  setup do
    @match_user = match_users(:one)
  end

  test "visiting the index" do
    visit match_users_url
    assert_selector "h1", text: "Match Users"
  end

  test "creating a Match user" do
    visit match_users_url
    click_on "New Match User"

    click_on "Create Match user"

    assert_text "Match user was successfully created"
    click_on "Back"
  end

  test "updating a Match user" do
    visit match_users_url
    click_on "Edit", match: :first

    click_on "Update Match user"

    assert_text "Match user was successfully updated"
    click_on "Back"
  end

  test "destroying a Match user" do
    visit match_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match user was successfully destroyed"
  end
end
