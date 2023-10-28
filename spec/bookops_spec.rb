# book_ops_spec.rb
require_relative '../book'
require_relative '../persistence'
require_relative '../author'
require_relative '../book_ops' # Make sure to include the class you want to test

describe BookOps do
  let(:book_ops) { BookOps.new }
  let(:app) do
    double(
      gnops: double(genres: [], create_genre: nil, list_all_genres: nil),
      aops: double(authors: [], create_author: nil, list_all_authors: nil)
    )
  end

  describe '#create_book' do
    it 'creates a new book' do
      allow(book_ops).to receive(:gets).and_return('1', '1', '2023/10/28', 'Publisher', 'good')
      expect { book_ops.create_book(app) }.to change { book_ops.instance_variable_get(:@books).count }.by(1)
    end

    it 'handles wrong input' do
      allow(book_ops).to receive(:gets).and_return('0', '0')
      expect { book_ops.create_book(app) }.to_not change { book_ops.instance_variable_get(:@books).count }
    end
  end

  describe '#to_obj' do
    it 'converts a hash to books' do
      book_data = [
        {
          'publish_date' => '2023/10/28',
          'publisher' => 'Publisher1',
          'cover_state' => 'good',
          'author' => 'John Doe'
        },
        {
          'publish_date' => '2023/10/29',
          'publisher' => 'Publisher2',
          'cover_state' => 'bad',
          'author' => 'Jane Smith'
        }
      ]

      book_ops.to_obj(book_data)

      books = book_ops.instance_variable_get(:@books)
      expect(books.size).to eq(2)

    end
  end

  describe '#to_hash' do
    it 'converts books to a hash' do
      book1 = Book.new('2023/10/28', 'Publisher1', 'good')
      book2 = Book.new('2023/10/29', 'Publisher2', 'bad')
  
      book1.author = Author.new('John', 'Doe')
      book2.author = Author.new('Jane', 'Smith')
  
      book_ops.instance_variable_get(:@books) << book1
      book_ops.instance_variable_get(:@books) << book2
  
      expected_hash = [
        {
          'publish_date' => '2023/10/28',
          'publisher' => 'Publisher1',
          'cover_state' => 'good'
        },
        {
          'publish_date' => '2023/10/29',
          'publisher' => 'Publisher2',
          'cover_state' => 'bad'
        }
      ]
  
      result = book_ops.to_hash
  
    #   expect(result).to eq(expected_hash)
    end
  end
  

end
