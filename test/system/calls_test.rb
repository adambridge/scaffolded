require "application_system_test_case"

class CallsTest < ApplicationSystemTestCase
  setup do
    @call = calls(:one)
  end

  test "visiting the index" do
    visit calls_url
    assert_selector "h1", text: "Calls"
  end

  test "should create call" do
    visit calls_url
    click_on "New call"

    fill_in "Coach", with: @call.coach_id
    fill_in "Notes", with: @call.notes
    fill_in "Satisfaction", with: @call.satisfaction
    fill_in "Start", with: @call.start
    fill_in "Student", with: @call.student_id
    click_on "Create Call"

    assert_text "Call was successfully created"
    click_on "Back"
  end

  test "should update Call" do
    visit call_url(@call)
    click_on "Edit this call", match: :first

    fill_in "Coach", with: @call.coach_id
    fill_in "Notes", with: @call.notes
    fill_in "Satisfaction", with: @call.satisfaction
    fill_in "Start", with: @call.start
    fill_in "Student", with: @call.student_id
    click_on "Update Call"

    assert_text "Call was successfully updated"
    click_on "Back"
  end

  test "should destroy Call" do
    visit call_url(@call)
    click_on "Destroy this call", match: :first

    assert_text "Call was successfully destroyed"
  end
end
