require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && (@on_spotify == true) # Assuming there is a parent class with this method

    false
  end
end

music = MusicAlbum.new(true, '12/12/2020')

puts music
puts music.can_be_archived?
