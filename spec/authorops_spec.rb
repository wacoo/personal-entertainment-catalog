require_relative '../author_ops'

describe AuthorOps do
  let(:author_ops) { AuthorOps.new }

  describe '#create_author' do
    it 'creates a new author and adds it to the authors list' do
      allow(author_ops).to receive(:gets).and_return("John", "Doe")
      author = author_ops.create_author
      expect(author.first_name).to eq("John")
      expect(author.last_name).to eq("Doe")
      expect(author_ops.authors).to include(author)
    end
  end

  describe '#to_hash' do
    it 'returns an array of authors as hashes' do
      author1 = Author.new('Alice', 'Johnson')
      author2 = Author.new('Bob', 'Smith')
      author_ops.authors << author1
      author_ops.authors << author2

      expected_hash = [
        { 'first_name' => 'Alice', 'last_name' => 'Johnson' },
        { 'first_name' => 'Bob', 'last_name' => 'Smith' }
      ]

      expect(author_ops.to_hash).to eq(expected_hash)
    end
  end
end
