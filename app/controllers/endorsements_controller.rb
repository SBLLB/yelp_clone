class EndorsementsController < ApplicationController
	def create
		@review = Review.find(params[:id])
		@review.endorsement.create
		redirect_to restaurants_path
	end 

end
