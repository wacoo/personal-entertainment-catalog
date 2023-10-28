require_relative 'source'

class SourceOps
  def initialize
    @sources = []
  end

  def create_source
    puts ''
    print 'Enter the name of the source: '
    source_name = gets.chomp

    # Check if the source name already exists
    if @sources.any? { |source| source.name == source_name }
      puts "Source '#{source_name}' already exists."
    else
      new_source = Source.new(source_name)
      @sources << new_source
      puts "Source '#{source_name}' added successfully!"
    end
  end

  def list_all_sources
    if @sources.empty?
      puts 'No sources added!'
    else
      @sources.each_with_index do |source, idx|
        puts "#{idx + 1}) Source: #{source.name}"
      end
    end
  end

  def to_hash
    hash_sources = @sources.map do |source|
      {
        'name' => source.name,
        'items' => source.items.map { |item| item.to_hash }
      }
    end
    hash_sources
  end

  def to_obj(list)
    list.each do |hash|
      source = Source.new(hash['name'])
      hash['items'].each do |item|
        source.items << Item.from_hash(item)
      end
      @sources << source
    end
  end

  def save_sources
    @persist.save('sources', to_hash)
  end

  def load_sources
    hash_list = @persist.load('sources')
    to_obj(hash_list)
  end
end
