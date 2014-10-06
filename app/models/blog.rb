class Blog < ActiveRecord::Base
  belongs_to :user

  has_many :reviews, as: :reviewable
  
  validates :content, :title, presence: true
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username) }
  end
end
