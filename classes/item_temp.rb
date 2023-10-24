require 'date'

class Item
  def initialize(publish_date, archived)
    @id = (1..100).to_a.shuffle
    @publish_date = publish_date
    @archived = archived
    # @genre = nil
    @author = nil
    # @source = nil
    # @label = nil
  end

  def can_be_archived?()
    current_date = Date.today
    parsed_date = Date.parse(@publish_date)
    years = current_date.year - parsed_date.year

    if current_date.month < parsed_date.month || (current_date.month == parsed_date.month && current_date.day < parsed_date.day)
        years -= 1
    end

    puts years
    if years > 10
        true
    else
        false
    end
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
    puts @archived
  end
end

# item = Item.new('2017/11/23', archived: false)
# puts item.can_be_archived?
# item.move_to_archive