class ApplicationController < ActionController::Base
    helper_method :ensure_logged_in, :logged_in?, :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        if logged_in?
            current_user.reset_session_token!
            session[:session_token] = nil
            current_user = nil
        end
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def ensure_logged_out
        redirect_to user_url(@current_user) if logged_in?
    end
end
