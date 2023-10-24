class Main
    def menu
        puts ""
        puts "**********************************"
        puts "* PERSONAL ENTERTAINMENT CATALOG *"
        puts "**********************************"
        puts ""
        puts "SELECT OPTIONS (1 - 10)"
        puts ""
        puts "  1) List all games"
        puts "  2) List all authors"
        puts "  3) Create a game"
        puts "  0) Exit"
        puts ""
        print "OPTION:> "
        input = gets.chomp.to_i
        puts ""
        puts input
        # Call the method that hadles the logic form APP class
    end

    def display
        loop do
            menu
        end
    end
end

main = Main.new
main.display