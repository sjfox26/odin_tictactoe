require_relative "../lib/game"
require_relative "../lib/player"
require_relative "../lib/board"

RSpec.describe Game do

  let (:steph) { Player.new({ name: "steph", letter: "X"}) }
  let (:kd) { Player.new({ name: "kd", letter: "O" }) }
  let (:players) { [:steph, :kd]}

#  context "#initialize" do
#    it "randomly selects a current_player" do
#      players.stub(:shuffle) { [steph, kd] }
#      #players.shuffle { [steph, kd] }
#      game = Game.new([steph, kd])
#      expect(game.current_player).to eq steph
#    end

#    it "randomly selects an other player" do
#      players.stub(:shuffle) { [steph, kd] }
#      #players.shuffle { [steph, kd] }
#      game = Game.new([steph, kd])
#      expect(game.other_player).to eq kd
#    end
#  end

  context "#switch_players" do
    it "will set @current_player to @other_player" do
      game = Game.new([steph, kd])
      other_player = game.other_player
      game.switch_players
      expect(game.current_player).to eq other_player
    end

    it "will set @other_player to @current_player" do
      game = Game.new([steph, kd])
      current_player = game.current_player
      game.switch_players
      expect(game.other_player).to eq current_player
    end
  end

  context "#get_number" do
    it "converts human_move of '1' to [0, 0]" do
      game = Game.new(players)
      expect(game.get_number("1")).to eq [0, 0]
    end

    it "converts human_move of '7' to [2, 0]" do
      game = Game.new(players)
      expect(game.get_number("7")).to eq [2, 0]
    end
  end


end