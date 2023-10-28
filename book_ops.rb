require_relative 'book'
require_relative 'persistence'
require_relative 'author'

class BookOps
  def initialize
    @books = []
    @persist = Persistence.new
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def create_book(app)
    puts ''
    puts 'Creating a new book....'

    if app.gnops.genres.empty?
      puts '😭 No genre added! 😭.Please create a new one '
      app.gnops.create_genre
    end
    app.gnops.list_all_genres

    puts ''
    print 'Select genre:> '
    genre = gets.chomp.to_i

    if app.aops.authors.empty?
      puts 'Please add an author'
      app.aops.create_author
    end
    puts 'Choose author from the list by number:'
    app.aops.list_all_authors

    author = gets.chomp.to_i

    if author >= 1 && genre >= 1
      publish_date = get_user_input('Enter book publish-date [YYYY/MM/DD]: ')
      publisher = get_user_input('Enter book publisher: ')
      cover_state = get_user_input('Enter cover state[good/bad?]: ')
      book = Book.new(publish_date, publisher, cover_state)
      auth = app.aops.authors[author - 1]
      app.gnops.genres[genre - 1]
      book.author = auth
      book.genre = genre
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

  def to_hash
    data = []
    @books.each do |book|
      book_item = {}
      book_item['publish_date'] = book.publish_date
      book_item['publisher'] = book.publisher
      book_item['cover_state'] = book.cover_state
      # book_item['genre'] = "#{book.genre.name}"
      book_item['author'] = "#{book.author.first_name} #{book.author.last_name}"

      data.push(book_item)
    end
    data
  end

  def to_obj(item)
    item.each do |book|
      publish_date = book['publish_date']
      publisher = book['publisher']
      cover_state = book['cover_state']
      author = book['author'].split
      # genre = book['genre']

      book_item = Book.new(publish_date, publisher, cover_state)
      book_item.author = Author.new(author[0], author[1])
      # book_item.genre = Genre.new(genre)

      @books << book_item
    end
  end

  def save_books
    hash_books = to_hash
    @persist.save('books', hash_books)
  end

  def load_books
    data = @persist.load('books')
    to_obj(data)
  end
end
