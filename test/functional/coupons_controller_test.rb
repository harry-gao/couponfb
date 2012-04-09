require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Coupon.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Coupon.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Coupon.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to coupon_url(assigns(:coupon))
  end

  def test_edit
    get :edit, :id => Coupon.first
    assert_template 'edit'
  end

  def test_update_invalid
    Coupon.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Coupon.first
    assert_template 'edit'
  end

  def test_update_valid
    Coupon.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Coupon.first
    assert_redirected_to coupon_url(assigns(:coupon))
  end

  def test_destroy
    coupon = Coupon.first
    delete :destroy, :id => coupon
    assert_redirected_to coupons_url
    assert !Coupon.exists?(coupon.id)
  end
end
