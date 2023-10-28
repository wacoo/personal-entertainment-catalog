class GameOps
  def initialize
    @games = []
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
      puts "#{idx + 1}) Game ID: #{game.id}, Genre: #{game.genre.name}, Title: #{game.label.title}, "\
      "Last played: #{game.last_played_at}"
    end
  end
end
