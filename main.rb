require_relative 'app'

class Main
  def menu(app)
    puts ''
    puts '**********************************'
    puts '* PERSONAL ENTERTAINMENT CATALOG *'
    puts '**********************************'
    puts ''
    puts 'SELECT OPTIONS (1 - 10)'
    puts ''
    puts '1) List all authors'
    puts '2) List all games'
    puts '3) List all books'
    puts '4) List all labels'
    puts '5) List all movies'
    puts '6) Add a movie'
    # add options here
    puts '8) Create an author'
    puts '9) Create a game'
    puts '10) Create a book'
    # add options here
    puts '0) Exit'
    puts ''
    print 'OPTION:> '
    input = gets.chomp.to_i
    puts ''
    app.handle_logic(input, app)
  end

  def display
    app = App.new
    loop do
      menu(app)
    end
  end
end

main = Main.new
main.display
