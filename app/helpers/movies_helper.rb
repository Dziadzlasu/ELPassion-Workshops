module MoviesHelper
  def show_average_rating(movie)
    movie.average_rating || 'No rating'
  end
end
