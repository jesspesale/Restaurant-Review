class RestaurantsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    # before_action :authenticate_user, except: [:index, :show]
        # makes sure a user is signed in before clicking link or else sent to sign in page

    def index
        @restaurants = Restaurant.all
    end

    def new
        @restaurant = Restaurant.new
        @restaurant.build_cuisine #instantiates a cuisine so we have one in the new restaurant form
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        # @restaurant.user_id = session[:user_id]     #do I need this?
        if @restaurant.save #where validations happen
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end

    def show
        @restaurant = Restaurant.find_by(id: params[:id])
        @user = current_user.id
    end


    private

    def restaurant_params
        params.require(:restaurant).permit(:restaurant_name, :address, :city, :state, cuisine_attributes: [:name])
    end
end
