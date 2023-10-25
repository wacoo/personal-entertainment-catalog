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
    # add options here
    puts 'List all books'
    puts 'List all labels (e.g. "Gift", "New")'
    puts 'Add a book'
    puts '  0) Exit'
    puts ''
    print 'OPTION:> '
    input = gets.chomp.to_i
    puts ''
    puts input
    app.handle_logic(input)
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
