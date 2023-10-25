require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(params)
    @on_spotify = params[:on_spotify]
    super.genre = params[:genre]
    super.author = params[:author]
    super.source = params[:source]
    super.label = params[:label]
    super(params[:published_date])
    @archived = false
  end

  def can_be_archived?
    return true if super.can_be_archived? && (@on_spotify == true) # Assuming there is a parent class with this method

    false
  end
end
