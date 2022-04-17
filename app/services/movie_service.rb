class MovieService

  def self.get_url(url, param = nil)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']

      faraday.params[:query] = param unless param == nil
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    get_url('movie/top_rated')[:results]
  end

  def self.search_for_movie(movie)
    get_url('search/movie', movie)[:results]
  end

  def self.movie_details(movie_id)
    get_url("movie/#{movie_id}")
  end

  def self.get_cast(movie_id)
    get_url("movie/#{movie_id}/credits")[:cast]
  end 

  def self.get_reviews(movie_id)
    get_url("movie/#{movie_id}/reviews")[:results]
  end 
end