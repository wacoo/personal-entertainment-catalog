require_relative '../music_album'
require_relative '../genre'

describe MusicAlbum do
  context 'MusicAlbum class' do
    it '(album) should be an instance of MusicAlbum' do
      album = MusicAlbum.new(true, '2023/9/24')
      expect(album).to be_instance_of(MusicAlbum)
    end

    it '(album) should respond on_spotify' do
      album = MusicAlbum.new(true, '2023/9/24')
      expect(album).to respond_to('on_spotify')
    end

    it '(album author first name) should be euqal to Classic' do
      album = MusicAlbum.new(true, '2023/9/24')
      album.genre = Genre.new('Classic')
      expect(album.genre.name).to eql('Classic')
    end
  end

  context 'can_be_archived? method' do
    it '(can_be_archived?) should return true when publish_date is above 10 years and on_spotify' do
      album = MusicAlbum.new(true, '2010/9/24')
      expect(album.can_be_archived?).to eql(true)
    end

    it '(can_be_archived?) should return false when publish_date is above 10 years and  not on_spotify' do
      album = MusicAlbum.new(false, '2010/9/24')
      expect(album.can_be_archived?).to eql(false)
    end

    it '(can_be_archived?) should return false when publish_date is below 10 years and on_spotify' do
      album = MusicAlbum.new(true, '2019/6/24')
      expect(album.can_be_archived?).to eql(false)
    end

    it '(can_be_archived?) should return false when publish_date is below 10 years and not on_spotify' do
      album = MusicAlbum.new(false, '2018/12/23')
      expect(album.can_be_archived?).to eql(false)
    end
  end
end
