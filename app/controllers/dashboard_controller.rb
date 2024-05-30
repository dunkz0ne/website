class DashboardController < ApplicationController
    def index
        @user = User.find(session[:user_id]) if session[:user_id]
        @team = Team.where(id: @user.team_id).first if @user
    end
end