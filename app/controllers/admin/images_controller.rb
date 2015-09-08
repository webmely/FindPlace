module Admin
	class ImagesController < AdminController
		def new
			@image = Image.new
		end

		def create
			@image = Image.new(image_params)
			@image.save
			redirect_to admin_images_path
		end

		def destroy
			@image = Image.find(params[:id])
			@image.destroy
			redirect_to :back
		end

		private
		def image_params
			params.require(:image).permit(:photo1, :photo2, :photo3, :photo4)
		end
	end
end