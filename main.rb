require_relative 'app'

class Main
  def menu(app)
    puts ''
    puts '*************************************************'
    puts '*         PERSONAL ENTERTAINMENT CATALOG        *'
    puts '*************************************************'
    puts ''
    puts 'SELECT OPTIONS (1 - 10)'
    puts ''
    puts '1) List all authors    9)  Create a game'
    puts '2) List all games      10) Create a book'
    puts '3) List all books      11) Create label'
    puts '4) List all labels     12) List all music albums'
    puts '5) List all movies     13) Create music album'
    puts '6) Create a movie      14) Create a source'
    puts '7) List all Sources    15) List all genres'
    puts '8) Create an author    16) Create a genre'
    puts '0) Exit' # add options here
    puts ''
    print 'OPTION:> '
    input = gets.chomp.to_i
    puts ''
    app.handle_logic(input, app)
  end

  def display
    app = App.new
    app.movies.load_movies
    loop do
      menu(app)
    end
  end
end

main = Main.new
main.display
