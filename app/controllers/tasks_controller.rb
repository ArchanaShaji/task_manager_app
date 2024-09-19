class TasksController < ApplicationController
    before_action :authenticate_user!

    def create
        @task = current_user.tasks.create!(task_params)
        if @task.save
            redirect_to tasks_path, notice: 'Task was successfully created.'
        else
        render :new
        end
    end

    private

    def task_params
        params.require(:task).permit(:name)
    end
end
