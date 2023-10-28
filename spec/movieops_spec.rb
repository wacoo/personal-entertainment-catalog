require_relative '../movie_ops'

describe MovieOps do
  let(:movie_ops) { MovieOps.new }

  describe '#to_obj' do
    it 'converts hash to movies' do
      hash_movies = [
        { 'publish_date' => '2023/10/28', 'silent' => true, 'genre_name' => 'Action', 'author' => 'John Doe' },
        { 'publish_date' => '2023/10/29', 'silent' => false, 'genre_name' => 'Comedy', 'author' => 'Jane Smith' }
      ]

      movie_ops.to_obj(hash_movies)

      movies = movie_ops.instance_variable_get(:@movies)
      expect(movies).to all(be_a(Movie))
      expect(movies.first).to have_attributes(
        publish_date: '2023/10/28',
        silent: true,
        genre: be_a(Genre),
        author: be_a(Author)
      )
    end
  end
end
