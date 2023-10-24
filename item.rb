require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :published_date
  attr_reader :id, :archived

  def initialize(published_date)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    current_year = Time.now.year
    item_year = Date.parse(@published_date).year
    # Check if the item's published_date is older than 10 years
    return true if current_year - item_year > 10

    false
  end
end

# item = Item.new("2003-03-19")
# puts item.can_be_archived?
# puts(item)
