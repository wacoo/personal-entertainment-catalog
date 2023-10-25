class MusicAlbum
  attr_accessor :on_spotify

  def initialize(on_spotify)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super.can_be_archived? && (@on_spotify == true) # Assuming there is a parent class with this method

    false
  end
end
