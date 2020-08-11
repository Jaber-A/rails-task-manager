class TasksController < ApplicationController

    before_action :set_task, only: [:show, :edit, :update, :destroy]


    def index
      @tasks = Task.all
    end

    def show
      @task = Task.find(params[:id])
    end

    def create # Create a task, post it to the DB
      @task = Task.new(strong_task_params) # Create task with strong params - the params that I have allowed
      @task.save
    
      redirect_to task_path(@task) # Redirect to the task I just created (UX reason - no view for the create action)
    end

    private

  # SECURITY MEASURE
  def strong_task_params # Whitelist approach - you specify which keys in the params hash you allow

    params.require(:task).permit(:name, :address, :rating)
    # params = {
      #   task = { name: "Ishin", address: "Mitte",rating: 4 }
      # }
   end


   def set_task
    @task = Task.find(params[:id])
   end


end
