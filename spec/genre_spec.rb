require_relative '../genre'
require_relative '../music_album'

describe Genre do
  context 'Genre class' do
    it '(genre) should be an instance of Genre' do
      genre = Genre.new('Country')
      expect(genre).to be_instance_of(Genre)
    end

    it '(genre) should respond id' do
      genre = Genre.new('Country')
      expect(genre).to respond_to('id')
    end

    it '(genre) should respond name' do
      genre = Genre.new('Country')
      expect(genre).to respond_to('name')
    end
  end

  context 'add_item method' do
    it '(items) should increased by one item' do
      album = MusicAlbum.new(true, '2010/12/23')
      genre = Genre.new('Country')
      expect(genre.items.length).to eql(0)
      genre.add_item(album)
      expect(genre.items.length).to eql(1)
    end

    it '(publish_date) should be 2009/12/23' do
      album = MusicAlbum.new(true, '2009/12/23')
      genre = Genre.new('Country')
      genre.add_item(album)
      expect(genre.items[0].publish_date).to eql('2009/12/23')
    end
  end
end
