class ApplicationController < ActionController::Base
  before_action :current_user,  only: %i[ show edit update destroy ]

    protected
    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
      if @current_user.nil?
        redirect_to root_path
      end
    end
end
