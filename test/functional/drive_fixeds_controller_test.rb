require 'test_helper'

class DriveFixedsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:drive_fixeds)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_drive_fixed
    assert_difference('DriveFixed.count') do
      post :create, :drive_fixed => { }
    end

    assert_redirected_to drive_fixed_path(assigns(:drive_fixed))
  end

  def test_should_show_drive_fixed
    get :show, :id => drive_fixeds(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => drive_fixeds(:one).id
    assert_response :success
  end

  def test_should_update_drive_fixed
    put :update, :id => drive_fixeds(:one).id, :drive_fixed => { }
    assert_redirected_to drive_fixed_path(assigns(:drive_fixed))
  end

  def test_should_destroy_drive_fixed
    assert_difference('DriveFixed.count', -1) do
      delete :destroy, :id => drive_fixeds(:one).id
    end

    assert_redirected_to drive_fixeds_path
  end
end
