require_relative '../game'
require_relative '../item'

describe Game do
  context 'Game class' do
    it '(game) should be an instance of Game' do
      game = Game.new('2010/12/23', true, '2023/9/24', false)
      expect(game).to be_instance_of(Game)
    end

    it '(game) should respond multiplayer' do
      game = Game.new('2010/12/23', true, '2023/9/24', false)
      expect(game).to respond_to('multiplayer')
    end

    it '(game) should respond last_played_at' do
      game = Game.new('2010/12/23', true, '2023/9/24', false)
      expect(game).to respond_to('last_played_at')
    end
  end

  context 'can_be_archived? method' do
    it '(can_be_archived?) should return true when publish_date is above 10 years and  last_played_at above 2 year' do
      game = Game.new(nil, '2010/12/23', true, '2020/9/24')
      expect(game.can_be_archived?).to eql(true)
    end

    it '(can_be_archived?) should return false when publish_date is above 10 years and  last_played_at below 2 year' do
      game = Game.new(nil, '2010/12/23', true, '2023/6/24')
      expect(game.can_be_archived?).to eql(false)
    end

    it '(can_be_archived?) should return false when publish_date is below 10 years and  last_played_at above 2 year' do
      game = Game.new(nil, '2018/12/23', true, '2019/6/24')
      expect(game.can_be_archived?).to eql(false)
    end

    it '(can_be_archived?) should return false when publish_date is below 10 years and  last_played_at below 2 year' do
      game = Game.new(nil, '2018/12/23', true, '2022/6/24')
      expect(game.can_be_archived?).to eql(false)
    end
  end
end
