class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
		@users = User.all
  end

  def show
  end

  def new
		@user = User.new
  end

  def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:success] = 'ユーザを登録しました'
			redirect_to '/tasks'
		else
			flash.now[:danger] = 'ユーザの登録に失敗しました'
			render :new
		end
  end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = 'ユーザー情報が更新されました'
			redirect_to user_path
		else
			flash.now[:danger] = 'ユーザー情報は更新されませんでした'
			render :edit
		end
	end

	def destroy
		@user.destroy

		flash[:success] = '退会しました'
		redirect_to :root
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
