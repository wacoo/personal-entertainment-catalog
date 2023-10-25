require_relative('item')

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(params)
    super(params[:publish_date])
    @multiplayer = params[:multiplayer]
    @last_played_at = params[:last_played_at]
    self.author = params[:author]
    self.genre = params[:genre]
    self.source = params[:source]
    self.label = params[:label]
  end

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

# game = Game.new('2010/12/23', true, '2023/9/24')
# puts game.can_be_archived?
# puts game
