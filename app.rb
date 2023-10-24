require_relative 'author'
require_relative 'game'
class App
  def initialize
    @authors = []
    @games = []
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
    if @authors.length.zero?
      puts ''
      puts '😭 No author added! 😭'
    end
    @authors.each_with_index do |author, idx|
      puts "#{idx + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def list_all_games
    if @games.length.zero?
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
    when 8
      create_author
    when 9
      create_game
    when 
      exit
    else
      puts 'Wrong input!'
    end
  end
end
