class ApplicationController < ActionController::Base
  protect_from_forgery

  def merchant_logged_in
    unless session[:merchant_id] != nil
      redirect_to merchant_login_url
    end
  end
end
