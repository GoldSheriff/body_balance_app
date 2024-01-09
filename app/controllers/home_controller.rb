class HomeController < ApplicationController
  
    before_action :authenticate_user!, only: [:profile]
  
    def index
      redirect_to workouts_path
    end
  
    def profile
      @current_user = current_user
      @workouts = current_user.workouts
    end
  end