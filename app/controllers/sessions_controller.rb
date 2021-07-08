class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user
			if user.authenticate(params[:session][:password])
				log_in user
				redirect_to '/tasks', notice: 'ログインしました'
			else
				flash.now[:danger] = 'パスワードが間違っているようです'
			end
		else
			flash.now[:danger] = 'メールアドレスが間違っているか、ユーザが存在しないようです'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to '/', notice: 'ログアウトしました'
	end
end
