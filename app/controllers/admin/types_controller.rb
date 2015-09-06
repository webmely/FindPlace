module Admin
	class TypesController < AdminController
		def index
			@types = Type.order("created_at DESC")
		end

		def new
			@type = Type.new
		end

		def create
			@type = Type.new(type_params)
			if @type.save
				redirect_to admin_types_path
			else
				render 'new'
			end
		end

		private
		def type_params
			params.require(:type).permit(:typename, :description)
		end
	end
end