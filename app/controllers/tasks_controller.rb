class TasksController < ApplicationController

	before_action :logged_in_user, only: [:edit, :update, :destroy]
	before_action :set_task, only: [:show, :edit, :update, :destroy]

	def index
		if logged_in?
			@tasks = current_user.tasks.page(params[:page]).per(10)
		end
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = current_user.tasks.build(task_params)

		if @task.save
			flash[:success] = 'タスクが作成されました'
			redirect_to '/tasks'
		else
			flash.now[:danger] = 'タスクは作成されませんでした'
			render :new
		end
	end

	def edit
	end

	def update

		if @task.update(task_params)
			flash[:success] = 'タスクが更新されました'
			redirect_to '/tasks'
		else
			flash.now[:danger] = 'タスクは更新されませんでした'
			render :edit
		end
	end

	def destroy
		@task.destroy

		flash[:success] = 'タスクが削除されました'
		redirect_to tasks_url
	end

	private

	# Strong Parameter
	def task_params
		params.require(:task).permit(:content, :title)
	end

	def set_task
		@task = Task.find(params[:id])
	end
end
