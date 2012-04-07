class MerchantsController < ApplicationController
  layout "merchant"

  before_filter :require_login, :except => [:create, :new]

  def index
    @merchants = Merchant.all
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

  private
  def require_login
    unless session[:merchant_id] != nil
      redirect_to merchant_login_url
    end
  end
end
