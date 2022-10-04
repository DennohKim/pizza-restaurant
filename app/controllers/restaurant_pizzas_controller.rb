class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        restaurantpizzas = RestaurantPizza.all
        render json: restaurantpizzas
    
    end

    def show
        restaurantpizza = RestaurantPizza.find(params[:id])
        render json: restaurantpizza
    end

    private

    def render_not_found_response
        render json: { error: "Author not found" }, status: :not_found
    end
end
