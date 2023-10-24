require 'date'

class Item
    attr_accessor :genre, :author, :source, :label, :published_date
    attr_reader :id, :archived

    def initialize(published_date)
        @id = Random.rand(1..1000)
        @published_date = published_date
        @archived = false
    end
end

# item = Item.new("2003-03-19")
# puts item.can_be_archived?
# puts(item)