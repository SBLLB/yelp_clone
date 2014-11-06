class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = @restaurant.reviews.new(review_params)
		@review.user = current_user
		if @review.save
			redirect_to '/restaurants'
		else
			flash[:notice] = "You've already reviewed this restaurant"
			redirect_to '/restaurants'
		end

	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		flash[:notice] = 'Review deleted successfully'
		redirect_to '/restaurants'
	end

	def review_params
		params.require(:review).permit(:thoughts, :rating)
		# params[:review].permit(:thoughts, :rating)
	end

end
