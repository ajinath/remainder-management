require 'test_helper'

class RemaindersControllerTest < ActionController::TestCase
  setup do
    @remainder = remainders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remainders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remainder" do
    assert_difference('Remainder.count') do
      post :create, remainder: { end_date: @remainder.end_date, group_id: @remainder.group_id, message: @remainder.message, name: @remainder.name, remainder_time: @remainder.remainder_time, schedule_interval: @remainder.schedule_interval, start_date: @remainder.start_date, status: @remainder.status }
    end

    assert_redirected_to remainder_path(assigns(:remainder))
  end

  test "should show remainder" do
    get :show, id: @remainder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remainder
    assert_response :success
  end

  test "should update remainder" do
    patch :update, id: @remainder, remainder: { end_date: @remainder.end_date, group_id: @remainder.group_id, message: @remainder.message, name: @remainder.name, remainder_time: @remainder.remainder_time, schedule_interval: @remainder.schedule_interval, start_date: @remainder.start_date, status: @remainder.status }
    assert_redirected_to remainder_path(assigns(:remainder))
  end

  test "should destroy remainder" do
    assert_difference('Remainder.count', -1) do
      delete :destroy, id: @remainder
    end

    assert_redirected_to remainders_path
  end
end
