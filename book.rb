require './item'

class Book < Item
  attr_accessor :name, :publisher, :published_date, :cover_state

  def initialize(params)
    super(params[:publish_date])
    super.genre = params[:genre]
    super.author = params[:author]
    super.source = params[:source]
    super.label = params[:label]
    @publisher = params [:publisher]
    @cover_state = params [:cover_state]
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
