class CouponsController < ApplicationController
  layout "merchant"
  before_filter :merchant_logged_in

  def hot
    @coupons = Coupon.all
    render :layout => "application"
  end

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(params[:coupon])
    @coupon.merchant_id = session[:merchant_id]
    if @coupon.save
      redirect_to @coupon, :notice => "Successfully created coupon."
    else
      render :action => 'new'
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])
    if @coupon.update_attributes(params[:coupon])
      redirect_to @coupon, :notice  => "Successfully updated coupon."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to coupons_url, :notice => "Successfully destroyed coupon."
  end
end
