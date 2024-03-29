class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :require_login

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
        # OR equals bc it will only call the db once if you 
        # are using current user more than once in a method
    end

    def logged_in?
        !!session[:user_id] 
    end

    def require_login
        unless logged_in?
        flash[:message] = "You must be logged in to do this"
        redirect_to login_path    
        end
    end


end
