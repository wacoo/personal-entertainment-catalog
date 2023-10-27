require_relative 'book'
class BookOps
  def initialize
    @books = []
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def create_book(app)
    puts ''
    puts 'Creating a new book....'

    # if app.genres.empty?
    #   puts 'create_genre'
    # else
    #   puts 'list_all_genres'
    # end

    if app.aops.authors.empty?
      puts 'Please add an author'
      app.aops.create_author
    end
    puts 'Choose author from the list by number:'
    app.aops.list_all_authors

    author = gets.chomp.to_i

    if author >= 1
      publish_date = get_user_input('Enter book publish-date [YYYY/MM/DD]: ')
      publisher = get_user_input('Enter book publisher: ')
      cover_state = get_user_input('Enter cover state[good/bad?]: ')
      book = Book.new(publish_date, publisher, cover_state)
      auth = app.aops.authors[author - 1]
      book.author = auth
      # genre = create_genre
      # book.genre = genre
      @books << book
    else
      puts 'Wrong input'
    end
    puts 'Book added successfully !!!'
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
end
