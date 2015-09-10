class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  #Using cancan
  rescue_from CanCan::AccessDenied do |exception|
    #redirect to page error 404.html
  	render :file => "#{Rails.root}/public/404.html", :status => 403, :layout => false
  end
  #End cancan

  def configure_permitted_parameters
    #check field is user signup
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :fullname, :address, :age, :role,:photo) }
    #check field is user update acction information   
	 devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :fullname, :address, :age, :role, :photo) }    
  end

end
