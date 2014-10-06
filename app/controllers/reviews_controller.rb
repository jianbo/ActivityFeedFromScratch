class ReviewsController < ApplicationController
  before_action :load_reviewable	
  after_action :create_activity, only:  [:create, :update, :destroy]

 def index
    respond_with @reviews = @reviewable.reviews
  end

  def show
    respond_with @review = Review.find(params[:id])
  end

  def create
    @review = @reviewable.reviews.new(permitted_params)
    @review.user = current_user
    @review.save
    respond_with @review
  end

  def update
    respond_with @blog = Review.update(params[:id], permitted_params)
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end

  private
  def create_activity
    feed_activity @review 
  end

  def permitted_params
      params.require(:review).permit(*permitted_review_attributes)
  end

  def load_reviewable
    resource, id = request.path.split('/')[1, 2]
    @reviewable = resource.singularize.classify.constantize.find(id)
  end
end
