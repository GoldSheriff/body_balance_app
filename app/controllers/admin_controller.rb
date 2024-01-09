class AdminController < ApplicationController
    def index
      @workouts = Workout.all
      authorize Workout, policy_class: AdminPolicy
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
    end
  end