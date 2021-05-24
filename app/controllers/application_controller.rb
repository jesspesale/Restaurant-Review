class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
        # OR equals bc it will only call the db once if you 
        # are using current user more than once in a method
    end



end
