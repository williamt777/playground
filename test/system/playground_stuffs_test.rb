require "application_system_test_case"

class PlaygroundStuffsTest < ApplicationSystemTestCase
  setup do
    @playground_stuff = playground_stuffs(:one)
  end

  test "visiting the index" do
    visit playground_stuffs_url
    assert_selector "h1", text: "Playground Stuffs"
  end

  test "creating a Playground stuff" do
    visit playground_stuffs_url
    click_on "New Playground Stuff"

    fill_in "Fun message", with: @playground_stuff.fun_message
    fill_in "School", with: @playground_stuff.school_id
    fill_in "Student", with: @playground_stuff.student
    fill_in "User", with: @playground_stuff.user_id
    click_on "Create Playground stuff"

    assert_text "Playground stuff was successfully created"
    click_on "Back"
  end

  test "updating a Playground stuff" do
    visit playground_stuffs_url
    click_on "Edit", match: :first

    fill_in "Fun message", with: @playground_stuff.fun_message
    fill_in "School", with: @playground_stuff.school_id
    fill_in "Student", with: @playground_stuff.student
    fill_in "User", with: @playground_stuff.user_id
    click_on "Update Playground stuff"

    assert_text "Playground stuff was successfully updated"
    click_on "Back"
  end

  test "destroying a Playground stuff" do
    visit playground_stuffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Playground stuff was successfully destroyed"
  end
end
