class AuthorOps
  attr_reader :authors

  def initialize
    @authors = []
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
end
