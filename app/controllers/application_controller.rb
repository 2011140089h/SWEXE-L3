class ApplicationController < ActionController::Base
    private
    def current_user
        if session[:userid]
            User.find_by(uid: session[:userid])
        end
    end
    
    helper_method :current_user
    
end
