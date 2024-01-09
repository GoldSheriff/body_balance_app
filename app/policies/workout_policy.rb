class WorkoutPolicy < ApplicationPolicy
    attr_reader :user, :workout
  
    def initialize(user, workout)
      @user = user
      @workout = workout
    end
  
    def create?
      @user.present? && @user.admin?
    end
  
    def update?
      @user.present? && @user.admin?
    end
  
    def destroy?
      @user.present? && @user.admin?
    end
  end