class MusicAlbum
  attr_accessor :on_spotify

  def initialize(on_spotify)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    if super.can_be_archived? # Assuming there is a parent class with this method
      return true if @on_spotify == true
    end
    false
  end
end
