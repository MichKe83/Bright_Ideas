class LikesController < ApplicationController
	before_action :require_login, except: [:index]

	def index
		
	end

	def create
		user = current_user
		idea = Idea.find(params[:id])
		like = Like.new(idea: idea, user: user)
		
		if like.save
			return redirect_to :back
		end
	end

	def destroy
		user = current_user
		idea = Idea.find(params[:id])

		like = Like.find_by(idea: idea, user: user)

		like.destroy

		return redirect_to :back

	end
	


end
