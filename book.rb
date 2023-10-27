require './item'

class Book < Item
  attr_accessor :publisher, :published_date, :cover_state

  def initialize(publisher, publish_date, cover_state)
    super(publish_date)

    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
