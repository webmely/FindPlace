module Admin
	class PostplacesController < AdminController
		def index
			@postplaces = Postplace.order("created_at DESC").page(params[:page]).per(10)
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

		def destroy
			@postplace = Postplace.find(params[:id])
			@postplace.destroy
			redirect_to :back
		end

		private
		def post_params
			params.require(:postplace).permit(:title, :content, :place_id)
		end
	end
end