require_relative 'movie'
require_relative 'persistence'

class MovieOps
  def initialize
    @movies = []
    @persist = Persistence.new
  end

  def message(item)
    puts ''
    puts "😭 No #{item} added! 😭"
    puts ''
    puts "Create a new #{item}"
    puts ''
  end

  def create_movie_with_banner(app)
    puts ''
    puts '*************************************************'
    puts '*             CREATE A NEW MOVIE                *'
    puts '*************************************************'
    puts ''
    create_movie(app)
  end

  def create_movie(app)
    if app.gnops.genres.empty?
      message('genre')
      app.gnops.create_genre
    end
    app.gnops.list_all_genres

    puts ''
    print 'Select genre:> '
    genre = gets.chomp.to_i

    if app.aops.authors.empty?
      message('author')
      app.aops.create_author
    end
    app.aops.list_all_authors
    puts ''
    print 'Select author:> '
    author = gets.chomp.to_i

    print 'Publish date [YYYY/MM/DD]:> '
    publish_date = gets.chomp
    print 'Is the movie silent? [true/false]:> '
    silent_input = gets.chomp

    silent = silent_input.downcase == 'true'
    movie = nil

    if author >= 1
      movie = Movie.new(publish_date, silent: silent)
      movie.genre = app.gnops.genres[genre - 1]
      movie.author = app.aops.authors[author - 1]
      @movies << movie
    else
      puts 'Wrong input!'
    end
    movie
  end

  def list_movies_with_banner
    puts ''
    puts '*************************************************'
    puts '*              LIST ALL MOVIES                  *'
    puts '*************************************************'
    list_all_movies
  end

  def list_all_movies
    if @movies.empty?
      puts ''
      puts '😭 No movies added! 😭'
    end
    @movies.each_with_index do |movie, idx|
      puts "#{idx + 1}) Movie ID: #{movie.id}, Title: #{movie.author.first_name} #{movie.author.last_name}'s Movie, Genre: #{movie.genre.name},
      Publish date: #{movie.publish_date}, Silent: #{movie.silent ? 'Yes' : 'No'}"
    end
  end

  def to_hash
    hash_books = []
    @movies.each do |movie|
      hb = {}
      hb['publish_date'] = movie.publish_date
      hb['silent'] = movie.silent
      hb['genre_name'] = movie.genre.name
      hb['author'] = "#{movie.author.first_name} #{movie.author.last_name}"
      hash_books << hb
    end
    hash_books
  end

  def to_obj(list)
    list.each do |hash|
      author = hash['author'].split
      movie = Movie.new(hash['publish_date'], silent: hash['silent'])
      movie.author = Author.new(author[0], author[1])
      movie.genre = Genre.new(hash['genre_name'])
      @movies << movie
    end
  end

  def save_movies
    @persist.save('movies', to_hash)
  end

  def load_movies
    hash_list = @persist.load('movies')
    to_obj(hash_list)
  end
end
