module Admin
	class AdminController < ApplicationController
		layout 'admin_application' #Using layout admin_application for admin page

		before_filter :authen

		private
		#check user with role admin
		
		def authen
			authorize! :manage, :all
		end
		
	end
end