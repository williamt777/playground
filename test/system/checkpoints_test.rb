require "application_system_test_case"

class CheckpointsTest < ApplicationSystemTestCase
  setup do
    @checkpoint = checkpoints(:one)
  end

  test "visiting the index" do
    visit checkpoints_url
    assert_selector "h1", text: "Checkpoints"
  end

  test "creating a Checkpoint" do
    visit checkpoints_url
    click_on "New Checkpoint"

    fill_in "Check at", with: @checkpoint.check_at
    fill_in "Description", with: @checkpoint.description
    fill_in "Duration days", with: @checkpoint.duration_days
    fill_in "Handle", with: @checkpoint.handle
    fill_in "School", with: @checkpoint.school_id
    fill_in "Student", with: @checkpoint.student_id
    click_on "Create Checkpoint"

    assert_text "Checkpoint was successfully created"
    click_on "Back"
  end

  test "updating a Checkpoint" do
    visit checkpoints_url
    click_on "Edit", match: :first

    fill_in "Check at", with: @checkpoint.check_at
    fill_in "Description", with: @checkpoint.description
    fill_in "Duration days", with: @checkpoint.duration_days
    fill_in "Handle", with: @checkpoint.handle
    fill_in "School", with: @checkpoint.school_id
    fill_in "Student", with: @checkpoint.student_id
    click_on "Update Checkpoint"

    assert_text "Checkpoint was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkpoint" do
    visit checkpoints_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkpoint was successfully destroyed"
  end
end
