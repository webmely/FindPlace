module Admin
	class TypesController < AdminController
		def index
			@types = Type.order("created_at DESC")
		end

		def new
			@type = Type.new
		end

		def edit
			@type = Type.find(params[:id])
		end

		def create
			@type = Type.new(type_params)
			if @type.save
				redirect_to admin_types_path
			else
				render 'new'
			end
		end

		def update
			@type = Type.find(params[:id])
			if @type.update(type_params)
				redirect_to admin_types_path
			else
				render 'edit'
			end
		end

		def destroy
			@type = Type.find(params[:id])
			@type.destroy
			redirect_to admin_types_path
		end

		private
		def type_params
			params.require(:type).permit(:typename, :description)
		end
	end
end