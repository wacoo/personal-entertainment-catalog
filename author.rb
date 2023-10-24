class Author
    attr_reader :id, :items
    attr_accessor :first_name, :last_name
    def initialize (first_name, last_name)
        @id = (101..200).to_a.shuffle
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
        item.author = self
        @items << item unless @items.include?(item)
    end
end
