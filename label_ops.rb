require_relative 'label'
require_relative 'persistence'

class LabelOps
  attr_reader :labels

  def initialize
    @labels = []
    @persist = Persistence.new
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

  def to_hash
    data = []
    @labels.each do |label|
      label_item = {}
      label_item['title'] = label.title
      label_item['color'] = label.color
      data.push(label_item)
    end
    data
  end

  def to_obj(item)
    item.each do |label|
      title = label['title']
      color = label['color']

      label_item = Label.new(title, color)
      @labels << label_item
    end
  end

  def save_labels
    hash_labels = to_hash
    @persist.save('labels', hash_labels)
  end

  def load_labels
    data = @persist.load('labels')
    to_obj(data)
  end
end
