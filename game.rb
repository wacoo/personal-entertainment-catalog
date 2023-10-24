require_relative('item')
require_relative('author')

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(author, publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    self.author = author
  end

  # def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
  #     super(publish_date)
  #     @multiplayer = multiplayer
  #     @last_played_at = last_played_at
  #     self.author = author
  #     self.genre = genre
  #     self.source = source
  #     self.label = label
  # end

  def can_be_archived?()
    parent_result = super
    current_date = Date.today
    parsed_date = Date.parse(@last_played_at)
    years = current_date.year - parsed_date.year

    years -= 1 if current_date.month < parsed_date.month || (current_date.month == parsed_date.month && current_date.day < parsed_date.day)

    # puts years
    if years > 2 && parent_result
      true
    else
      false
    end
  end
end

# author = Author.new('Wonde', 'Abre')
# game = Game.new(author, '2010/12/23', true, '2020/9/24')
# puts game.can_be_archived?
# puts game
