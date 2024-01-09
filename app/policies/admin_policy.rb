class AdminPolicy < ApplicationPolicy
    attr_reader :user, :workout
  
    def initialize(user, workout)
      @user = user
      @workout = workout
    end
  
    def index?
      @user.present? && @user.admin?
    end
  end