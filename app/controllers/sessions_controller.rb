class SessionsController < ApplicationController

    def welcome

    end

    def new
        

    end

    def create #does the user exist in our system
        # byebug
        @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password ])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "Sorry, something went wrong. Please try again. "
                redirect_to login_path
            end
    end

    def destroy
        session.delete(:user_id)
        redirect_to "/"
    end

end