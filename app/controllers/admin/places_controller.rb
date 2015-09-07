module Admin
	class PlacesController < AdminController
		def index
			@places = Place.order("created_at")
		end

		def new
			@place = Place.new

		end

		def edit
			@place = Place.find(params[:id])
		end

		def create
			@place = Place.new(places_params)
			if !params[:place][:photo].nil?
				if @place.save
						params[:place][:photo].each do |picture|
							@place.image.create(:photo => picture)
						end
						redirect_to admin_places_path

				else
					render 'new'
				end
			else
				@msg = "Ban chua chon anh"
				render 'new'
			end
		end

		def update
			@place = Place.find(params[:id])
			if @place.update(places_params)
				redirect_to admin_places_path
			else
				render 'edit'
			end
		end

		def destroy
			@place = Place.find(params[:id])
			@place.destroy
			redirect_to admin_places_path
		end

		private
		def places_params
			params.require(:place).permit(:name, :address, :description, :star_id, :type_id, :provice_id)
		end
	end
end
