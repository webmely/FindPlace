module Admin
	class ProvicesController < AdminController
		def index
			@provices = Provice.order("created_at DESC")
		end

		def new
			@provice = Provice.new
		end

		def create
			@provice = Provice.new(provice_params)
			if @provice.save
				redirect_to admin_provices_path
			else
				redirect_to :back
			end
		end
		

		private
		def provice_params
			params.require(:provice).permit(:name)
		end
	end
end