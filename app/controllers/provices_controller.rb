class ProvicesController < ApplicationController
	#ham hien thi ajax autocomplete provice
		def load_provice
			@search = Provice.search(params[:q])
			#Tra du lieu ve view kieu json
			respond_to do |format|
     				format.json {render json: @search }
   			end
		end
end
