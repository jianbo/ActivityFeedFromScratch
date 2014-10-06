class ActivitiesController < ApplicationController
	def index
		@activities = Activity.includes(:user, :trackable).all.page(params[:page]).per(20)
	end
end
