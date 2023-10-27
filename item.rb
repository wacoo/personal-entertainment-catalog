require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current_year = Time.now.year
    item_year = Date.parse(@publish_date).year
    # Check if the item's published_date is older than 10 years
    return true if current_year - item_year > 10

    false
  end

  # method for archive
  def move_to_archive
    @archived = true if can_be_archived?
  end
end
