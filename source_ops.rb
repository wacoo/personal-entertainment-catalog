require_relative 'source'
class SourceOps
  attr_reader :labels

  def initialize
    @sources = []
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def create_source
    puts ''
    puts 'Adding New Source...'
    name = get_user_input('Enter Source Name: ')
    source = Source.new(name)
    @sources << source
    puts 'Source created successfully !!!'
  end

  def list_all_sources
    puts 'Sources are empty!!:' if @sources.empty?
    puts ''
    puts '________SOURCES__________'
    puts ''
    @sources.each_with_index do |source, idx|
      puts "#{idx + 1}) #{source.name}"
    end
  end
end
