require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_driver
    assert_difference('Driver.count') do
      post :create, :driver => { }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  def test_should_show_driver
    get :show, :id => drivers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => drivers(:one).id
    assert_response :success
  end

  def test_should_update_driver
    put :update, :id => drivers(:one).id, :driver => { }
    assert_redirected_to driver_path(assigns(:driver))
  end

  def test_should_destroy_driver
    assert_difference('Driver.count', -1) do
      delete :destroy, :id => drivers(:one).id
    end

    assert_redirected_to drivers_path
  end
end
