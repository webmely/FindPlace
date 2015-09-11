module Admin
	class PlacesController < AdminController
		def index
			@places = Place.order("created_at DESC").page(params[:page]).per(10)
		end

		def show
			@place = Place.find(params[:id])
		end

		def new
			@place = Place.new

		end

		def edit
			@place = Place.find(params[:id])
		end

		def create
			@place = Place.new(places_params)
			#kiem tra chon file image gioi thieu cho place
			if !params[:place][:photo].nil?
				if @place.save
					#sau khi luu place thi luu image gioi thieu vao bang image
						params[:place][:photo].each do |picture|
							@place.image.create(:photo => picture)
						end
						redirect_to admin_places_path
				else
					render 'new'
				end
			else
				#Thong bao neu chua chon anh gioi thieu cho dia diem
				@message = "Bạn chưa chọn ảnh nào giới thiệu cho địa điểm này ."
				render 'new'
			end
		end

		def update
			@place = Place.find(params[:id])
			#Kiem tra xem co image gioi thieu nao chon de xoa khong
			unless params[:photo_old].nil?
			      params[:photo_old].each do |key|
			      	#xoa image duoc chon
			        	image = Image.find(key[0])
			        	image.destroy
			        end
		      end 
		      #update place
			if @place.update(places_params)
				#kiem tra nguoi dung co upload image gioi thieu moi khong
				unless params[:place][:photo].nil?
					params[:place][:photo].each do |picture|
						#luu imag gioi thieu moi vao bang image
						@place.image.create(:photo => picture)
					end
				end
				
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
			params.require(:place).permit(:name, :address, :description, :star_id, :type_id, :provice_id, :avatar)
		end
	end
end
