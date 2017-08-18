class IdeasController < ApplicationController
	before_action :require_login, only: [:create, :destroy, :show]

	def index	
		@idea = Idea.find(params[:id])
		@likes = Like.all.where(idea: params[:id])

		# @users = User.find_by(like: params[:id])
		# # p @likes.ideas_liked
		# # p @likes = Idea.user.where(idea: params[:id])
		# p @like = Like.all.where(user: params[:id]).includes(:user)
		# p @like.first_name
		# p "!!!!!!!!!!!!!!!!!!!!!"

		return render "index.html"
	end

	def new
	end

	def create
		user = current_user

		p user 
		
		p idea = Idea.new(idea_params.merge(user: user))
		p idea.valid?

		if idea.save
			return redirect_to "/users/#{user.id}"
		end

		flash[:errors] = secret.errors.full_messages

	end

	def show
		@user = User.find(params[:id])
		@idea = Idea.all.where(user: params[:id]).includes(:user)

		@like = Like.all
		p @liked_by = @idea.user.nick_name
		p "!!!!!!!!!!!!!!!!!!!!!"
		
	end

	def destroy
		user = session[:user_id]
		idea = Idea.find(params[:id])
		idea.destroy
		return redirect_to "/users/#{user}"
	end

	private
		def idea_params
			params.require(:idea).permit(:content)
		end

		# def auth
		# 	return redirect_to user_path(current_user)unless current_user.id == params[:id].to_i
		# end


end
