class App
<<<<<<< HEAD
    def exit
        puts ""
        puts "**********************************"
        puts "Thank you for using this app"
        puts "Goodbye"
        puts "**********************************"
        puts ""
        Kernel.exit
    end
end
=======
  def exit
    puts ''
    puts '**********************************'
    puts 'Thank you for using this app'
    puts 'Goodbye'
    puts '**********************************'
    puts ''
    Kernel.exit
  end

  def handle_logic(input)
    # add logic here
    if input.zero?
      self.exit
    else
      puts 'Wrong input!'
    end
  end
end
>>>>>>> 1e733a34f57fc8c6e9a7f75ba3ea790a8b5d097b
