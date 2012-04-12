class SessionsController < ApplicationController
  layout "merchant"
  def new
  end

  def create
    merchant = Merchant.authenticate(params[:email], params[:password])
    if merchant
      session[:merchant_id] = merchant.id
      redirect_to merchant, :notice => "Merchant logged in"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:merchant_id] = nil
    redirect_to merchant_home_url
  end
end
