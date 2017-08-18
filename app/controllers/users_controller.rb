class UsersController < ApplicationController
	before_action :require_login, except: [:create, :index, :new]
 	# before_action :auth, except: [:create, :info]

 	def index		
	end

	def new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id

			return redirect_to "/users/#{@user.id}"
		end

		flash[:errors] = @user.errors.full_messages

		return redirect_to :back
	end

	def show
		@user = User.find(params[:id])
		@ideas = Idea.all
		@like = Like.all
		@likedIdea = Idea.all
	end

	def info
		@user = User.find(params[:id])
		@ideas = Idea.all.where(user: params[:id]).includes(:user)
		p @likes = Like.all.where(user: params[:id])
		
	
		return render "info.html"

	end

	def edit
		@user = User.find(params[:id])
		return render 'edit.html'
	end

	def update

		@user = User.find(params[:id])

		if @user.update(user_params)
			return redirect_to "/users/#{@user.id}"
		end
		
		flash[:errors] =  @user.errors.full_messages
		return	redirect_to :back		
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		session.clear
		return redirect_to ''
	end


	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :nick_name, :email, :password, :password_confirmation)
		end

		# def auth
		# 	return redirect_to user_path(current_user)unless current_user.id == params[:id].to_i
		# end








end
