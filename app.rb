class App
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
