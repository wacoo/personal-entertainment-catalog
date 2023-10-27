require './movie'

describe Movie do
  context 'Initialization' do
    let(:movie) { Movie.new('2023-10-28', silent: true) }

    it 'is an instance of Movie' do
      expect(movie).to be_an_instance_of(Movie)
    end

    it 'is initialized properly with the provided attributes' do
      expect(movie.publish_date).to eq('2023-10-28')
      expect(movie.silent).to be(true)
    end
  end

  context '#can_be_archived?' do
    let(:new_movie) { Movie.new('2023-10-28', silent: false) }
    let(:archived_movie) { Movie.new('2021-01-01', silent: true) }

    it 'returns false for a new movie' do
      expect(new_movie.can_be_archived?).to be(false)
    end

    it 'returns true for an archived movie' do
      expect(archived_movie.can_be_archived?).to be(true)
    end
  end
end