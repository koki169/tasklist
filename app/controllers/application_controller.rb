class ApplicationController < ActionController::Base
	include SessionsHelper

	private
	# ログイン済みユーザかどうかを確認
	def logged_in_user
		unless logged_in?
			redirect_to logged_url
		end
	end
end
