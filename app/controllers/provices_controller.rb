class ProvicesController < ApplicationController
	#function load ajax autocomple provice name
		def load_provice
			@search = Provice.search(params[:q])
			respond_to do |format|
     				format.json {render json: @search }
   			end
		end
end
