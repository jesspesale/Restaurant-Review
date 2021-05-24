class ReviewsController < ApplicationController

    def new
        if @restaurant = Restaurant.find_by(id: params[:restaurant_id])
            @review = @restaurant.reviews.build
        else
            @review = Review.new
        end
    end

    def index

    end

end
