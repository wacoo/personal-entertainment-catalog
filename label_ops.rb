require_relative 'label'

class LabelOps
  attr_reader :labels

  def initialize
    @labels = []
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

    puts 'Label created successfully !!!'
  end

  def list_all_labels
    puts 'Labels are empty!!😭' if @labels.empty?
    puts ''
    puts '________LABELS__________'
    @labels.each_with_index do |label, idx|
      puts "#{idx + 1}) Title: #{label.title}, Color:#{label.color}"
    end
  end
end
