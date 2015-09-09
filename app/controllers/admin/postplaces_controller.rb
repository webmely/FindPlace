module Admin
	class PostplacesController < AdminController
		def index
			@postplaces = Postplace.order("created_at DESC")
		end

		def show
			@postplace = Postplace.find(params[:id])
		end

		def new
			@postplace = Postplace.new
		end

		def edit
			@postplace = Postplace.find(params[:id])
		end

		def create
			@postplace = Postplace.new(post_params)
			if @postplace.save
				redirect_to admin_postplaces_path
			else
				render 'new'
			end
		end

		def update
			@postplace = Postplace.find(params[:id])
			if @postplace.update(post_params)
				redirect_to admin_postplaces_path
			else
				render 'edit'
			end
		end

		private
		def post_params
			params.require(:postplace).permit(:title, :content, :place_id)
		end
	end
end