class ApplicationController < ActionController::Base
    def current_custumer
        @current_custumer ||= Custumer.find_by_id session[:custumer_id]
    end
    
    helper_method :current_custumer #this method can now be called from both the controllers and the views
    
    def custumer_signed_in?
        current_custumer.present? #return true or false 
    end
    helper_method :custumer_signed_in?
    
    def authenticate_custumer! #redirect if the user is not signed in
        redirect_to new_sessions_path, notice: 'Please sign in' unless custumer_signed_in?
    end
    helper_method :authenticate_custumer!

    def current_user
        @current_user ||= Custumer.find_by_id session[:custumer_id]
    end

    helper_method :current_user 
end
