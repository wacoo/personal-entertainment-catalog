require_relative 'persistence'

class GameOps
  def initialize
    @games = []
    @persist = Persistence.new
  end

  def message(item)
    puts ''
    puts "😭 No #{item} added! 😭"
    puts ''
    puts "Create a new #{item}"
    puts ''
  end

  def create_game_with_banner(app)
    puts ''
    puts '*************************************************'
    puts '*                CREATE A NEW GAME              *'
    puts '*************************************************'
    puts ''
    create_game(app)
  end

  def genre_author_input(app)
    if app.gnops.genres.empty?
      message('genre')
      app.gnops.create_genre
    end
    app.gnops.list_all_genres

    puts ''
    print 'Select genre:> '
    genre = gets.chomp.to_i

    if app.lops.labels.empty?
      message('label')
      app.lops.create_label
    end
    app.lops.list_all_labels
    puts ''
    print 'Select label:> '

    label = gets.chomp.to_i
    [genre, label]
  end

  def create_game(app)
    gi = genre_author_input(app)
    genre = gi[0]
    label = gi[1]
    print 'Publish date:> '
    pub_date = gets.chomp
    print 'Last played at[DATE]:> '
    last_played_date = gets.chomp
    print 'Multi-player[Y/N]:> '
    multi = gets.chomp

    multiplayer = false
    game = nil
    multiplayer = true if multi.upcase == 'Y'

    if label >= 1
      game = Game.new(pub_date, multiplayer, last_played_date)
      game.label = app.lops.labels[label - 1]
      game.genre = app.gnops.genres[genre - 1]
      @games << game
    else
      puts 'Wrong input!'
    end
    game
  end

  def list_games_with_banner
    puts ''
    puts '*************************************************'
    puts '*                 LIST ALL GAMES                *'
    puts '*************************************************'
    list_all_games
  end

  def list_all_games
    if @games.empty?
      puts ''
      puts '😭 No game added! 😭'
    end
    @games.each_with_index do |game, idx|
      puts "#{idx + 1}) Game ID: #{game.id}, Genre: #{game.genre.name}, Title: #{game.label.title}, " \
           "Last played: #{game.last_played_at}"
    end
  end

  def to_hash
    hash_games = []
    @games.each do |game|
      hb = {}
      hb['publish_date'] = game.publish_date
      hb['multiplayer'] = game.multiplayer
      hb['last_played_at'] = game.last_played_at
      hb['genre_name'] = game.genre.name
      hb['title'] = "#{game.label.title}"
      hb['color'] = " #{game.label.color}"
      hash_games << hb
    end
    hash_games
  end

  def to_obj(list)
    list.each do |hash|
      game = Game.new(hash['publish_date'], hash['multiplayer'], hash['last_played_at'])
      game.label = Label.new(hash['title'], hash['color'])
      game.genre = Genre.new(hash['genre_name'])
      @games << game
    end
  end

  def save_games
    @persist.save('games', to_hash)
  end

  def load_games
    hash_list = @persist.load('games')
    to_obj(hash_list)
  end
end
