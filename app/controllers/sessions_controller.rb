class SessionsController < ApplicationController

    def welcome

    end

    def new
        

    end

    def create #does the user exist in our system
        if (params[:user][:email]) == "" || (params[:user][:password]) == ""
            
            flash[:message] = "Invalid email or password, please try again."
            render '/sessions/new'
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password ])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "Sorry, something went wrong. Please try again. "
                redirect_to login_path
            end
        end
    end

    
    def destroy
        session.delete(:user_id)
        redirect_to "/"
    end
    
    def google
        # byebug
        @user = User.from_omniauth(auth)
 
        session[:user_id] = @user.id
 
        redirect_to user_path(@user)
        # access_token = request.env["omniauth.auth"]
        # user.google_token = access_token.credentials.token
        # user.google_refresh_token = refresh_token if refresh_token.present?
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end

end