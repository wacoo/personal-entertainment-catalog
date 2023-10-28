# game_ops_spec.rb

require 'rspec'
require_relative '../game_ops' 


describe GameOps do
  let(:app) { double("App") }
  let(:gnops) { double("GenreOps") }
  let(:lops) { double("LabelOps") }

  before do
    allow(app).to receive(:gnops).and_return(gnops)
    allow(app).to receive(:lops).and_return(lops)
  end

  subject(:game_ops) { GameOps.new }



  describe "#list_all_games" do
    it "lists all games with their details" do
      game1 = Game.new("2023-10-28", true, "2023-10-28")
      game1.genre = Genre.new("Action")
      game1.label = Label.new("Title", "Red")
      game2 = Game.new("2023-10-29", false, "2023-10-29")
      game2.genre = Genre.new("Adventure")
      game2.label = Label.new("Another Title", "Blue")

      game_ops.instance_variable_set(:@games, [game1, game2])

      expect { game_ops.list_all_games }.to output(/Game ID: #{game1.id}, Genre: Action, Title: Title, Last played: 2023-10-28/).to_stdout
      expect { game_ops.list_all_games }.to output(/Game ID: #{game2.id}, Genre: Adventure, Title: Another Title, Last played: 2023-10-29/).to_stdout
    end

    it "displays a message when no games are available" do
      game_ops.instance_variable_set(:@games, [])

      expect { game_ops.list_all_games }.to output(/😭 No game added! 😭/).to_stdout
    end
  end

  describe "#to_hash" do
    it "converts games to a hash format" do
      game1 = Game.new("2023-10-28", true, "2023-10-28")
      game1.genre = Genre.new("Action")
      game1.label = Label.new("Title", "Red")
      game2 = Game.new("2023-10-29", false, "2023-10-29")
      game2.genre = Genre.new("Adventure")
      game2.label = Label.new("Another Title", "Blue")

      game_ops.instance_variable_set(:@games, [game1, game2])

      expected_hash = [
        {
          "publish_date" => "2023-10-28",
          "multiplayer" => true,
          "last_played_at" => "2023-10-28",
          "genre_name" => "Action",
          "title" => "Title",
          "color" => " Red"
        },
        {
          "publish_date" => "2023-10-29",
          "multiplayer" => false,
          "last_played_at" => "2023-10-29",
          "genre_name" => "Adventure",
          "title" => "Another Title",
          "color" => " Blue"
        }
      ]

      expect(game_ops.to_hash).to eq(expected_hash)
    end
  end
end
