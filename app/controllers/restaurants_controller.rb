class RestaurantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        restaurants = Restaurant.all
        render json: restaurants, include: ['pizzas']
    
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, include: ['pizzas']
    end

    private

    def render_not_found_response
        render json: { error: "Author not found" }, status: :not_found
    end
end
