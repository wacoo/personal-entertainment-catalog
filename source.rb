class Source
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
