require_relative '../author'
require_relative '../game'

describe Author do
  context 'Author class' do
    it '(author) should be an instance of Author' do
      author = Author.new('John', 'Smith')
      expect(author).to be_instance_of(Author)
    end

    it '(author) should respond id' do
      author = Author.new('John', 'Smith')
      expect(author).to respond_to('id')
    end

    it '(author) should respond first_name' do
      author = Author.new('John', 'Smith')
      expect(author).to respond_to('first_name')
    end

    it '(author) should respond last_name' do
      author = Author.new('John', 'Smith')
      expect(author).to respond_to('last_name')
    end

    it '(author) should respond items' do
      author = Author.new('John', 'Smith')
      expect(author).to respond_to('items')
    end
  end

  context 'add_item method' do
    it '(items) should increased by one item' do
      author = Author.new('John', 'Smith')
      game = Game.new(nil, '2010/12/23', true, '2023/9/24')
      expect(author.items.length).to eql(0)
      author.add_item(game)
      expect(author.items.length).to eql(1)
    end

    it '(publish_date) should be 2009/12/23' do
      game = Game.new(nil, '2009/12/23', true, '2023/9/24')
      author = Author.new('Jane', 'Smith')
      author.add_item(game)
      expect(author.items[0].last_played_at).to eql('2023/9/24')
    end
  end
end
