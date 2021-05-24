class ReviewsController < ApplicationController

    def new
        if @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            @review = @restaurant.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        # @review = Review.new(review_params)
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def index
        #if nested, only show reviews for that restaurant
        if params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            @reviews = @restaurant.reviews
        else    #else just show all the reviews in the db
            @reviews = Review.all
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :restaurant_id)
    end

end
