class RestaurantsController < ApplicationController

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
    end


    private

    def restaurant_params
        params.require(:restaurant).permit(:restaurant_name, :address, :city, :state, :category)
    end
end
