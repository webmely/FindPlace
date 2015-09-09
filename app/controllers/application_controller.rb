class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Using cancan
  rescue_from CanCan::AccessDenied do |exception|
    #redirect to page error 404.html
  	render :file => "#{Rails.root}/public/404.html", :status => 403, :layout => false
  end
  #End cancan

end
