require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'author_ops'
require_relative 'game_ops'
require_relative 'label_ops'
require_relative 'book_ops'

class App
  attr_reader :genre, :aops, :lops

  def initialize
    # @authors = []
    @games = []
    @books = []
    @aops = AuthorOps.new
    @gops = GameOps.new
    @lops = LabelOps.new
    @bops = BookOps.new
    @genre = [] # temp
  end

  def exit
    puts ''
    puts '**********************************'
    puts '*  Thank you for using this app. *'
    puts '*           Goodbye 👋           *'
    puts '**********************************'
    puts ''
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

      8 => -> { @aops.create_author_with_banner },
      9 => -> { @gops.create_game_with_banner(app) },
      10 => -> { @bops.create_book(app) },
      11 => -> { @lops.create_label},
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
