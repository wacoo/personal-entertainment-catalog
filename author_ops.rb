require_relative 'persistence'
require_relative 'author'
class AuthorOps
  attr_reader :authors

  def initialize
    @authors = []
    @persist =  Persistence.new
  end

  # def get_authors
  #   @authors
  # end

  def create_author_with_banner
    puts ''
    puts '**********************************'
    puts '       CREATE A NEW AUTHOR        '
    puts '**********************************'
    puts ''
    create_author
  end

  def create_author
    puts ''
    print 'First name:> '
    fname = gets.chomp
    print 'Last name:> '
    lname = gets.chomp

    author = Author.new(fname, lname)
    @authors << author
    author
  end

  def list_authors_with_banner
    puts ''
    puts '**********************************'
    puts '         LIST ALL AUTHORS         '
    puts '**********************************'
    list_all_authors
  end

  def list_all_authors
    if @authors.empty?
      puts ''
      puts '😭 No author added! 😭'
    end
    @authors.each_with_index do |author, idx|
      puts "#{idx + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def to_hash
    hash_books = []
    @authors.each do |author|
      hb = {}
      hb['first_name'] = author.first_name
      hb['last_name'] = author.last_name
      hash_books << hb
    end
    hash_books
  end

  def to_obj(list)
    list.each do [hash]
      puts hash
      #author = Author.new(hash['first_name'], hash['last_name'])
      #@authors << author
    end
  end

  def save_books
    @persist.save('authors', to_hash)
  end

  def load_books
    hash_list = @persist.load('authors')
    puts 'hash_list'
    puts hash_list
    to_obj(hash_list)
  end
end
