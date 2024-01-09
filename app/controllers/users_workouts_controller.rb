class UsersWorkoutsController < ApplicationController
    before_action :authenticate_user!
  
    def buy
      workout = Workout.find params[:id]
      unless current_user.workouts.where(id: params[:id]).any?
        current_user.workouts << workout
      end
      redirect_to workout
    end
  
    def cancel
      workout = Workout.find params[:id]
      if current_user.workouts.where(id: params[:id]).any?
        current_user.workouts.delete workout.id
      end
      redirect_to workout
    end
  end