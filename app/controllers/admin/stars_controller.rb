module Admin
	class StarsController < AdminController
		def index
			@stars = Star.order("created_at DESC")
		end

		def new
			@star = Star.new
		end

		def edit
			@star = Star.find(params[:id])
		end

		def create
			@star = Star.new(star_params)
			if @star.save
				redirect_to admin_stars_path
			else
				render 'new'
			end
		end

		def update
			@star = Star.find(params[:id])
			if @star.update(star_params)
				redirect_to admin_stars_path
			else
				render 'edit'
			end
		end

		def destroy
			@star = Star.find(params[:id])
			@star.destroy
			redirect_to admin_stars_path
		end

		private
		def star_params
			params.require(:star).permit(:starcount, :description)
		end
	end
end