require_relative '../music_album'
require_relative '../item'

describe MusicAlbum do
  context 'MusicAlbum class' do
    it '(album) should be an instance of MusicAlbum' do
      album = MusicAlbum.new(true, '2023/9/24')
      expect(album).to be_instance_of(MusicAlbum)
    end

    it '(album) should respond on_spotify' do
      game = MusicAlbum.new('2010/12/23', true, '2023/9/24')
      expect(game).to respond_to('on_spotify')
    end

    it '(game) should respond last_played_at' do
      game = MusicAlbum.new('2010/12/23', true, '2023/9/24')
      expect(game).to respond_to('last_played_at')
    end

    it '(game author first name) should be euqal to John' do
      game = MusicAlbum.new('2010/12/23', true, '2023/9/24')
      game.author = Author.new('John', 'Smith')
      expect(game.author.first_name).to eql('John')
    end

    it '(game author last name) should be euqal to Smith' do
      game = MusicAlbum.new('2010/12/23', true, '2023/9/24')
      game.author = Author.new('John', 'Smith')
      expect(game.author.last_name).to eql('Smith')
    end
  end

  context 'can_be_archived? method' do
    it '(can_be_archived?) should return true when publish_date is above 10 years and  last_played_at above 2 year' do
      game = MusicAlbum.new('2010/12/23', true, '2020/9/24')
      expect(game.can_be_archived?).to eql(true)
    end

    it '(can_be_archived?) should return false when publish_date is above 10 years and  last_played_at below 2 year' do
      game = MusicAlbum.new('2010/12/23', true, '2023/6/24')
      expect(game.can_be_archived?).to eql(false)
    end

    it '(can_be_archived?) should return false when publish_date is below 10 years and  last_played_at above 2 year' do
      game = MusicAlbum.new('2018/12/23', true, '2019/6/24')
      expect(game.can_be_archived?).to eql(false)
    end

    it '(can_be_archived?) should return false when publish_date is below 10 years and  last_played_at below 2 year' do
      game = MusicAlbum.new('2018/12/23', true, '2022/6/24')
      expect(game.can_be_archived?).to eql(false)
    end
  end
end
