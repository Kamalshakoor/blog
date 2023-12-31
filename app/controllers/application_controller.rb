class ApplicationController < ActionController::Base
    helper_method :current_user,:logged_in?
    def current_user
        # if we have already current user then we'll simply return instance variable otherwise we'll check in database
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!current_user #bolean condition to check if current_user exist or not
    end
    def require_user
        if !logged_in?
            flash[:notice]= "You must be logged In to perform this action!"
            redirect_to login_path
        end
    end
end
