class Source
  attr_accessor :items, :name

  def initialize(name)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
