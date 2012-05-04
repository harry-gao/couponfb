class ApplicationController < ActionController::Base
  protect_from_forgery

  def merchant_logged_in
    unless session[:merchant_id] != nil
      redirect_to merchant_login_url
    end
  end

  def about
  end

  def contact_us

  end

  def under_construction

  end

  def method_missing(meth, *args, &block)
    render :under_construction
  end
end
