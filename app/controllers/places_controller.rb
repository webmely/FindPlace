class PlacesController < ApplicationController
	def show
		@place = Place.find(params[:id])
		@comments = Comment.where(place_id: params[:id]).order("created_at DESC")
	end

	def create_comment
		@comment = Comment.new
		@comment.content = params[:cm_content]
		@comment.user_id = params[:user_id]
		@comment.place_id = params[:place_id]
		if @comment.save
			redirect_to :back
		end

	end
end
