class RatingsController < ApplicationController
  before_action :authenticate_user!
  def create
    rating = Rating.find_or_create_by(movie_id: params[:movie_id], user: current_user)
      rating.value = params[:value]
      rating.save
    redirect_to movie_path(id: params[:movie_id]), notice: 'Rating added!'
  end
end
