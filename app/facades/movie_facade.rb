class MovieFacade
    def best_movies
      MovieService.top_rated.map do |data|
        Movie.new(data)
      end.take(20)
    end

    def search(movie)
      MovieService.search_for_movie(movie).map do |data|
        Movie.new(data)
      end.take(40)
    end

    def details(movie_id)
      MovieDetail.new(MovieService.movie_details(movie_id))
    end 

    def cast(movie_id)
      MovieService.get_cast(movie_id).map do |data|
        MovieCast.new(data)
      end.take(10)
    end

    def reviews(movie_id)
      MovieService.get_reviews(movie_id).map do |data|
        MovieReview.new(data)
      end
    end 

    def providers(movie_id)
      MovieProvider.new(MovieService.get_providers(movie_id))
    end 
end
