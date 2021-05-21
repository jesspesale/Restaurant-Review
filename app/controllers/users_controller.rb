class UsersController < ApplicationController

    def new
       @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.in    #log them in
            redirect_to user_path(@user)
        else
            render :new
        end
    end


    privat

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
