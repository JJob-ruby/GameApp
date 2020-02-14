require 'test_helper'

class MatchUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match_user = match_users(:one)
  end

  test "should get index" do
    get match_users_url
    assert_response :success
  end

  test "should get new" do
    get new_match_user_url
    assert_response :success
  end

  test "should create match_user" do
    assert_difference('MatchUser.count') do
      post match_users_url, params: { match_user: {  } }
    end

    assert_redirected_to match_user_url(MatchUser.last)
  end

  test "should show match_user" do
    get match_user_url(@match_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_user_url(@match_user)
    assert_response :success
  end

  test "should update match_user" do
    patch match_user_url(@match_user), params: { match_user: {  } }
    assert_redirected_to match_user_url(@match_user)
  end

  test "should destroy match_user" do
    assert_difference('MatchUser.count', -1) do
      delete match_user_url(@match_user)
    end

    assert_redirected_to match_users_url
  end
end
