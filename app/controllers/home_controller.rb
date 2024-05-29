class HomeController < ApplicationController
    def index
        @team = Team.first
        
    end
end