require 'test_helper'

class PlaygroundStuffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playground_stuff = playground_stuffs(:one)
  end

  test "should get index" do
    get playground_stuffs_url
    assert_response :success
  end

  test "should get new" do
    get new_playground_stuff_url
    assert_response :success
  end

  test "should create playground_stuff" do
    assert_difference('PlaygroundStuff.count') do
      post playground_stuffs_url, params: { playground_stuff: { fun_message: @playground_stuff.fun_message, school_id: @playground_stuff.school_id, student: @playground_stuff.student, user_id: @playground_stuff.user_id } }
    end

    assert_redirected_to playground_stuff_url(PlaygroundStuff.last)
  end

  test "should show playground_stuff" do
    get playground_stuff_url(@playground_stuff)
    assert_response :success
  end

  test "should get edit" do
    get edit_playground_stuff_url(@playground_stuff)
    assert_response :success
  end

  test "should update playground_stuff" do
    patch playground_stuff_url(@playground_stuff), params: { playground_stuff: { fun_message: @playground_stuff.fun_message, school_id: @playground_stuff.school_id, student: @playground_stuff.student, user_id: @playground_stuff.user_id } }
    assert_redirected_to playground_stuff_url(@playground_stuff)
  end

  test "should destroy playground_stuff" do
    assert_difference('PlaygroundStuff.count', -1) do
      delete playground_stuff_url(@playground_stuff)
    end

    assert_redirected_to playground_stuffs_url
  end
end
