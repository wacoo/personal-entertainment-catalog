class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = (301..400).to_a.shuffle
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
