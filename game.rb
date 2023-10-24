require_relative('item')

class Game < Item
    attr_accessor :multiplayer, :last_played_at
    def initialize(author, publish_date, multiplayer, last_played_at)
        super(publish_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        self.author = author
    end
    
    def can_be_archived?()
        parent_result = super
        current_date = Date.today
        parsed_date = Date.parse(@last_played_at)
        years = current_date.year - parsed_date.year
    
        if current_date.month < parsed_date.month || (current_date.month == parsed_date.month && current_date.day < parsed_date.day)
            years -= 1
        end
    
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