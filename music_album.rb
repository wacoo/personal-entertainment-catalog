require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, label, published_date, on_spotify)
    @on_spotify = on_spotify
    super.genre = genre
    super.author = author
    super.source = source
    super.label = label
    super.published_date = published_date
    @archived = false
  end

  def can_be_archived?
    return true if super.can_be_archived? && (@on_spotify == true) # Assuming there is a parent class with this method

    false
  end
end
