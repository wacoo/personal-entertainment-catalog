require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'genre'

class App
  def initialize
    @authors = []
    @games = []
    @books = []
    @labels = []
    @genres = []
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
      book = Book.new( publish_date, publisher, cover_state)
      auth = @authors[author - 1]
      book.author = auth
      # genre = create_genre
      # book.genre = genre
      @books << book
    else
      puts 'Wrong input'
    end
    book
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
  def create_author
    puts '**********************************'
    puts '       CREATE A NEW AUTHOR        '
    puts '**********************************'
    puts ''
    print 'First name:> '
    fname = gets.chomp
    print 'Last name:> '
    lname = gets.chomp

    author = Author.new(fname, lname)
    @authors << author
    author
  end

  def create_game
    puts '**********************************'
    puts '        CREATE A NEW GAME        '
    puts '**********************************'
    puts ''
    list_all_authors
    puts ''
    print 'Select author:> '

    author = gets.chomp.to_i
    print 'Publish date:> '
    pub_date = gets.chomp
    print 'Last played at[DATE]:> '
    last_played_date = gets.chomp
    print 'Multi-player[Y/N]:> '
    multi = gets.chomp

    multiplayer = false
    game = nil
    multiplayer = true if multi.upcase == 'Y'

    if author >= 1
      game = Game.new(@authors[author - 1], pub_date, multiplayer, last_played_date)
      @games << game
    else
      puts 'Wrong input!'
    end
    game
  end

  def list_all_authors
    if @authors.empty?
      puts ''
      puts '😭 No author added! 😭'
    end
    @authors.each_with_index do |author, idx|
      puts "#{idx + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def list_all_games
    if @games.empty?
      puts ''
      puts '😭 No game added! 😭'
    end
    @games.each_with_index do |game, idx|
      puts "#{idx + 1}) Game ID: #{game.id} Author: #{game.author.first_name} #{game.author.last_name} Last played: #{game.last_played_at}"
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

  def handle_logic(input)
    case input
    when 1
      list_all_authors
    when 2
      list_all_games
    when 3
      list_all_books
    when 4
      list_all_labels
    when 8
      create_author
    when 9
      create_game
    when 10
      create_book
    when 0
      exit
    else
      puts 'Wrong input!'
    end
  end
end
