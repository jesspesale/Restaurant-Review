class ReviewsController < ApplicationController
    before_action :require_login  , except: [:index, :show]
   
    #before_action !:authenticate_user ??

    def index
        #if nested, only show reviews for that restaurant
        if params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            @reviews = @restaurant.reviews
        else    #else just show all the reviews in the db
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def new
        if @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            @review = @restaurant.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
            # When a user writes a new review, the user id will be assigned to them
        if @review.save 
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def edit
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @review = Review.find_by_id(params[:id])
    end

    def update
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @review = Review.find_by_id(params[:id])
        if @review.update(review_params)
            redirect_to restaurant_path(@restaurant)
        else
            render :edit
        end
    end

    def destroy
        @review = Review.find_by_id(params[:id])
        @review.destroy
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :restaurant_id)
    end

    # def find_restaurant
    #     @restaurant = Restaurant.find_by(id: params[:id])
    # end

    
end
