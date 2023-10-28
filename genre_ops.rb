require_relative 'persistence'

class GenreOps
  attr_reader :genres

  def initialize
    @genres = []
    @persist = Persistence.new
  end

  def create_genre_with_banner
    puts ''
    puts '*************************************************'
    puts '*               CREATE A NEW GENRE              *'
    puts '*************************************************'
    puts ''
    create_genre
  end

  def create_genre
    puts ''
    print 'Genre name:> '
    gname = gets.chomp

    genre = Genre.new(gname)
    @genres << genre
    genre
  end

  def list_genre_with_banner
    puts ''
    puts '*************************************************'
    puts '*                 LIST ALL GENRES               *'
    puts '*************************************************'
    list_all_genres
  end

  def list_all_genres
    if @genres.empty?
      puts ''
      puts '😭 No genre added! 😭'
    end
    @genres.each_with_index do |genre, idx|
      puts "#{idx + 1}) #{genre.name}"
    end
  end

  def to_hash
    hash_genres = []
    @genres.each do |genre|
      hb = {}
      hb['name'] = genre.name
      hash_genres << hb
    end
    hash_genres
  end

  def to_obj(list)
    list.each do |hash|
      genre = Genre.new(hash['name'])
      @genres << genre
    end
  end

  def save_genres
    @persist.save('genres', to_hash)
  end

  def load_genres
    hash_list = @persist.load('genres')
    to_obj(hash_list)
  end
end
