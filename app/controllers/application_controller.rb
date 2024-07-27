class ApplicationController < ActionController::Base
  before_action :current_user,  only: %i[show edit update destroy ]

  def current_user
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_path
    end
  end

end
