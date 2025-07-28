module MoviesHelper

  def movies_exist?
    !@movies.blank?
  end
end
