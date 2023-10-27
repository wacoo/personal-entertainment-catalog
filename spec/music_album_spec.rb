require_relative '../music_album'
require_relative '../item'

describe 'MusicAlbum' do
  describe '#can_be_archived' do
    it 'achived when on spotify and  older than 5 year' do
      current_year = Date.today.year
      publish_year = current_year - 6
      spotify = true
      album = MusicAlbum.new(spotify, 'pop')
      album.publish_date = "#{publish_year}-01-01"
      expect(album.send(:can_be_archived?)).to be true
    end

    it 'not archived when on spotify but not older than a year' do
      current_year = Date.today.year
      publish_year = current_year - 4
      spotify = true
      album = MusicAlbum.new(spotify, 'hip-hop')
      album.publish_date = "#{publish_year}-01-01"
      expect(album.send(:can_be_archived?)).to be false
    end
  end
end
