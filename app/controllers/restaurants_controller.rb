class RestaurantsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(restaurant_params)
		@restaurant.user = current_user
		if @restaurant.save
			redirect_to '/restaurants'
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		flash[:notice] = "You are not authorised to edit this restaurant"
		redirect_to '/restaurants'
	
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(restaurant_params)
		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = 'Restaurant deleted successfully'
		redirect_to '/restaurants'
	end

	private

	def restaurant_params
		params[:restaurant].permit(:name)
	end

end
