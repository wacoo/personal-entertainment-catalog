require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'author_ops'
require_relative 'game_ops'

class App
  attr_reader :genre, :aops

  def initialize
    # @authors = []
    @games = []
    @books = []
    @labels = []
    @aops = AuthorOps.new
    @gops = GameOps.new
    @genre = [] # temp
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def create_label
    puts ''
    puts 'Adding New Label...'

    title = get_user_input('Enter label title: ')
    color = get_user_input('Enter label color: ')

    label = Label.new(title, color)
    @labels << label

    # puts 'Label created successfully !!!'
  end

  def create_book
    puts ''
    puts 'Creating a new book....'

    # if @genres.empty?
    #   puts 'create_genre'
    # else
    #   puts 'list_all_genres'
    # end

    if @authors.empty?
      puts 'Please add an author'
      create_author
    end
    puts 'Choose author from the list by number:'
    list_all_authors

    author = gets.chomp.to_i

    if author >= 1
      publish_date = get_user_input('Enter book publish-date [YYYY/MM/DD]: ')
      publisher = get_user_input('Enter book publisher: ')
      cover_state = get_user_input('Enter cover state[good/bad?]: ')
      book = Book.new(publish_date, publisher, cover_state)
      auth = @authors[author - 1]
      book.author = auth
      # genre = create_genre
      # book.genre = genre
      @books << book
    else
      puts 'Wrong input'
    end
    puts 'Book added successfully !!!'
  end

  def list_all_labels
    puts 'Labels are empty!!😭' if @labels.empty?
    puts ''
    puts '________LABELS__________'
    @labels.each_with_index do |label, idx|
      puts "#{idx + 1}) Color: #{label.title} Title:#{label.color}"
    end
  end

  def list_all_books
    puts 'Booklist is empty!Please add a book' if @books.empty?
    puts ''
    puts '________Book List__________'
    puts ''

    @books.each_with_index do |book, idx|
      puts "#{idx + 1}) Book ID: #{book.id}, Publisher: #{book.publisher}, Published Date: #{book.published_date}, Cover State: #{book.cover_state}"
    end
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
      10 => -> { @bops.create_book },
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
