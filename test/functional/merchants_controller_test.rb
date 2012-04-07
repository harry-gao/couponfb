require 'test_helper'

class MerchantsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Merchant.first
    assert_template 'show'
  end

  def test_edit
    get :edit, :id => Merchant.first
    assert_template 'edit'
  end

  def test_update_invalid
    Merchant.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Merchant.first
    assert_template 'edit'
  end

  def test_update_valid
    Merchant.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Merchant.first
    assert_redirected_to merchant_url(assigns(:merchant))
  end

  def test_create_invalid
    Merchant.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Merchant.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to merchant_url(assigns(:merchant))
  end

  def test_new
    get :new
    assert_template 'new'
  end
end
