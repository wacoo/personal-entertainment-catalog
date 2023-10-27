require_relative 'movie'

class MovieOps
    def initialize
        @movies = []
    end

    def create_movie
        puts ''
        puts 'Creating a new movie...'
    
        if @genres.empty?
          puts 'Please add a genre first'
          # You may decide to create_genre here or give a notice to the user.
        end
    
        if @authors.empty?
          puts 'Please add an author'
          create_author
        end
    
        puts 'Choose author from the list by number:'
        list_all_authors
    
        author = gets.chomp.to_i
    
        if author >= 1
          publish_date = get_user_input('Enter movie publish-date [YYYY/MM/DD]: ')
          silent = get_user_input('Is the movie silent? [true/false]: ')
          silent = silent.downcase == 'true'
    
          movie = Movie.new(publish_date, silent: silent)
          auth = @authors[author - 1]
          movie.author = auth
          # Optionally, you can assign a genre as with the Book.
          @movies << movie
        else
          puts 'Wrong input'
        end
        puts 'Movie added successfully !!!'
    end

    def list_all_movies
        puts 'Movie list is empty! Please add a movie' if @movies.empty?
        puts ''
        puts '________Movie List__________'
        puts ''
    
        @movies.each_with_index do |movie, idx|
          puts "#{idx + 1}) Movie ID: #{movie.id}, Published Date: #{movie.published_date}, Silent: #{movie.silent}"
        end
    end
end
    