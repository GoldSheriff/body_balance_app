class WorkoutsController < ApplicationController

        def index
          @workouts = Workout.all
        end
      
        
        def show
          @user_buy_current_workout = user_signed_in? && current_user.workouts.where(id: params[:id]).any?
          @workout = Workout.find(params[:id])
        end
      
     
        def new
          @workout = Workout.new
          authorize @workout
        rescue Pundit::NotAuthorizedError
          redirect_to root_path
        end
      
       
        def edit
          @workout = Workout.find(params[:id])
          authorize @workout
        rescue Pundit::NotAuthorizedError
          redirect_to root_path
        end
      
        def create
          @workout = Workout.new(workout_params)
      
          respond_to do |format|
            if @workout.save
              format.html { redirect_to :admin_page, notice: "Тренировка была успешно создана." }
              format.json { render :show, status: :created, location: @workout }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @workout.errors, status: :unprocessable_entity }
            end
          end
        end
      
       
        def update
          @workout = Workout.find(params[:id])
          respond_to do |format|
            if @workout.update(workout_params)
              format.html { redirect_to :admin_page, notice: "Тренировка была успешно обновлена." }
              format.json { render :show, status: :ok, location: @workout }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @workout.errors, status: :unprocessable_entity }
            end
          end
        end
      
   
        def destroy
          @workout = Workout.find(params[:id])
          begin
            authorize @workout
          rescue Pundit::NotAuthorizedError
            redirect_to root_path
            return
          end
            
            @workout.destroy
      
            respond_to do |format|
                format.html { redirect_to workouts_url, notice: "Тренировка была успешно удалена." }
                format.json { head :no_content }
            end
        end
      
        private
      
    
        def set_workout
          @workout = Workout.find(params[:id])
        end
      
        
        def workout_params
          params.require(:workout).permit(:title, :descriprtion)
        end
    
end
