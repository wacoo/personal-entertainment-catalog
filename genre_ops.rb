class GenreOps
  attr_reader :genres

  def initialize
    @genres = []
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
end
