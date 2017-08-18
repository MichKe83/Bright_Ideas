class SessionsController < ApplicationController
	# before_action :require_login, only: [:destroy]
	# before_action :auth, only: [:destroy]
	
	def new
	end

	def create
	
		@user = User.find_by_email(params[:email])

		if @user.try(:authenticate, params[:password])
			session[:user_id] = @user.id

			return redirect_to "/users/#{@user.id}"
		end

		flash[:errors] = ["Invalid account credentials"]

		return redirect_to :back

	end

	def destroy
		session.clear
		return redirect_to ''
	end

	# private
	# 	def auth
	# 		return redirect_to user_path(current_user)unless current_user.id == params[:id].to_i
	# 	end



end
