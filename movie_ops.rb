require_relative 'movie'
require_relative 'persistence'
require_relative 'genre'
require_relative 'author'
class MovieOps
  attr_reader :persist

  def initialize
    @movies = []
    @persist = Persistence.new
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def create_movie(app)
    puts ''
    puts 'Creating a new Movie....'
    author_fname = get_user_input('Enter Authors First Name: ')
    author_lname = get_user_input('Enter Authors Last Name: ')
    author_name = app.aops.authors.find { |author| author.first_name == author_fname && author.last_name == author_lname }
    if author_name.nil?
      author = Author.new(author_fname, author_lname)
      app.aops.authors << author
      author
    end
    new_genre = get_user_input('Enter movie genre: ')
    genre_item = nil
    movie_genre = app.gnops.genres.find { |genre| genre.name.upcase = new_genre.upcase }
    if movie_genre.nil?
      genre_item = Genre.new(new_genre)
      app.gnops.genres << genre_item
      genre_item
    end
    publish_date = get_user_input('Enter movie publish-date [YYYY/MM/DD]: ')
    movie = Movie.new(publish_date)
    auth = "#{author_fname} #{author_lname} "
    movie.author = auth
    movie.genre = genre_item
    @movies << movie
    puts 'Movie added successfully !!!'
  end

  def list_all_movies
    puts 'Movielist is empty!Please add a movie' if @movies.empty?
    puts ''
    puts '________Movie List__________'
    puts ''
    @movies.each_with_index do |movie, idx|
      puts "#{idx + 1}) Movie ID: #{movie.id}, Author: #{movie.author}, Genre: #{movie.genre.name}, Published Date: #{movie.publish_date} "
    end
  end

  def to_hash
    data = []
    @movies.each do |movie|
      movie_item = {}
      movie_item['publish_date'] = movie.publish_date
      movie_item['genre'] = movie.genre
      movie_item['author'] = "#{movie.author.first_name} #{movie.author.last_name}"
      data.push(movie_item)
    end
    data
  end

  def to_obj(item)
    item.each do |movie|
      publish_date = movie['publish_date']
      movie['genre']
      author = movie['author'].split
      movie_item = Movie.new(publish_date)
      movie_item.author = Author.new(author[0], author[1])
      @movies << movie_item
    end
  end

  def save_movies
    hash_movies = to_hash
    @persist.save('movies', hash_movies)
  end

  def load_movies
    items = @persist.load('movies')
    to_obj(items)
  end
end
