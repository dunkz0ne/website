class ApplicationController < ActionController::Base
    before_action :set_team

    private

    def set_team
        @user = User.find(session[:user_id]) if session[:user_id]
        @team = Team.where(id: @user.team_id).first if @user
    end
end
