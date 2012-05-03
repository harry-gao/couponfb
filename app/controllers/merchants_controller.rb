class MerchantsController < ApplicationController

  before_filter :merchant_logged_in, :except => [:create, :new]

  def index
    @coupons = Coupon.find_all_by_merchant_id(session[:merchant_id])
    render 'coupons/index'
  end

  def home
    @coupons = Coupon.find_all_by_merchant_id(session[:merchant_id])
    render 'coupons/index'
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    if @merchant.update_attributes(params[:merchant])
      redirect_to @merchant, :notice  => "Successfully updated merchant."
    else
      render :action => 'edit'
    end
  end

  def create
    @merchant = Merchant.new(params[:merchant])
    if @merchant.save
      redirect_to @merchant, :notice => "Successfully created merchant."
    else
      render :action => 'new'
    end
  end

  def new
    @merchant = Merchant.new
  end

end
