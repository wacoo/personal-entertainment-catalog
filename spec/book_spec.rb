# book_spec.rb
require 'rspec'
require_relative '../book'

describe Book do
  let(:publisher) { 'Acme Publishing' }
  let(:published_date) { '2023-01-01' }
  let(:cover_state) { 'good' }

  describe '#initialize' do
    it 'creates a new Book instance' do
      book = Book.new(publisher, published_date, cover_state)
      expect(book).to be_a(Book)
    end

    it 'correctly sets the instance variables' do
      book = Book.new(publisher, published_date, cover_state)
      expect(book.publisher).to eq('Acme Publishing')
      expect(book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    context 'when the book can be archived' do
      it 'returns true' do
        book = Book.new(publisher, published_date, 'bad')
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the book cannot be archived' do
      it 'returns false if cover state is not "bad"' do
        book = Book.new(publisher, published_date, 'good')
        expect(book.can_be_archived?).to be false
      end
    end
  end
end
