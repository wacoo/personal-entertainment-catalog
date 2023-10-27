require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'movie'
require_relative 'source'
require_relative 'author_ops'
require_relative 'game_ops'
require_relative 'label_ops'
require_relative 'book_ops'
require_relative 'music_album_ops'
require_relative 'genre_ops'
require_relative 'movie_ops.rb'
require_relative 'source_ops.rb'

class App
  attr_reader :genre, :aops, :lops, :gops, :maops, :gnops, :mops, :sops

  def initialize
    # @authors = []
    # @games = []
    # @books = []
    # @labels = []
    @aops = AuthorOps.new
    @gops = GameOps.new
    @lops = LabelOps.new
    @bops = BookOps.new
    @maops = MusicAlbumOps.new
    @gnops = GenreOps.new
    @movies = MovieOps.new
    @sops = SourceOps.new
  end

  def exit
    puts ''
    puts '*************************************************'
    puts '*          Thank you for using this app.        *'
    puts '*                   Goodbye 👋                  *'
    puts '*************************************************'
    Kernel.exit
  end

  def handle_wrong_input
    puts 'Wrong input!'
  end

  def handle_logic(input, app)
    actions = {
      1 => -> { @aops.list_authors_with_banner },
      2 => -> { @gops.list_games_with_banner },
      3 => -> { @bops.list_all_books },
      4 => -> { @lops.list_all_labels },
      5 => -> { @movies.list_movies_with_banner },
      6 => -> { @movies.create_movie(app) },
      7 => -> { @sops.list_all_sources },
      8 => -> { @aops.create_author_with_banner },
      9 => -> { @gops.create_game_with_banner(app) },
      10 => -> { @bops.create_book(app) },
      11 => -> { @lops.create_label },
      12 => -> { @maops.list_album_with_banner },
      13 => -> { @maops.create_album_with_banner(app) },
      14 => -> { @sops.create_source },
      15 => -> { @gnops.list_genre_with_banner },
      16 => -> { @gnops.create_genre_with_banner },
      0 => method(:exit)
    }

    action = actions[input]
    if action
      action.call
    else
      handle_wrong_input
    end
  end
end
