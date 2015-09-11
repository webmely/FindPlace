class PlacesController < ApplicationController
	#ham hien thi thong tin chi tiet dia diem
	def show
		@place = Place.find(params[:id]) #show place theo id
		#load comment theo place id
		@comments = Comment.where(place_id: params[:id]).order("created_at DESC")
	end
	#ham luu comment vao db
	def create_comment
		@comment = Comment.new
		@comment.content = params[:cm_content] #lay noi dung comment
		@comment.user_id = params[:user_id] #lay user dang nhap hien tai
		@comment.place_id = params[:place_id] #lay place id
		if @comment.save
			redirect_to :back
		end
	end
end
