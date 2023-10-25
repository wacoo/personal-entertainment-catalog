require './item'

class Book < Item
  attr_accessor :name, :publisher, :published_date, :cover_state

  def initialize(name, publisher, _published_date, cover_state)
    super(publish_date)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
