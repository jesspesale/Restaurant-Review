class ReviewsController < ApplicationController
    before_action :require_login  , except: [:index, :show]
   

    def index
        if params[:restaurant_id]  #if nested, only show reviews for that restaurant
            @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            @reviews = @restaurant.reviews
        else    #else just show all the reviews in the db
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
        @restaurant = @review.restaurant
    end

    def new
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @review = @restaurant.reviews.build
            #builds the review on top/ for that restaurant (with its ID)
    end

    def create
        @review = Review.new(review_params)
        @restaurant = Restaurant.find_by_id(params[:review][:restaurant_id])
        @review.user_id = current_user.id
        if @review.save 
            redirect_to review_path(@review)
        else
            render :new
        end
     end

    def edit
        @restaurant = Restaurant.find_by(id: params[:id])
        @review = Review.find_by_id(params[:id])
    end

    def update
        @restaurant = Restaurant.find_by_id(params[:review][:restaurant_id])
        @review = Review.find_by_id(params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
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

    
end
