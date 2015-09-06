module Admin
	class ProvicesController < AdminController
		def index
			@provices = Provice.order("created_at DESC").page(params[:page]).per(10)
		end

		def new
			@provice = Provice.new
		end

		def edit
			@provice = Provice.find(params[:id])
		end

		def create
			@provice = Provice.new(provice_params)
			if @provice.save
				redirect_to admin_provices_path
			else
				render 'new'
			end
		end
		
		def update
			@provice = Provice.find(params[:id])
			if @provice.update(provice_params)
				redirect_to admin_provices_path
			else
				render 'edit'
			end
		end

		def destroy
			@provice = Provice.find(params[:id])
			@provice.destroy
			redirect_to admin_provices_path
		end

		private
		def provice_params
			params.require(:provice).permit(:name)
		end
	end
end