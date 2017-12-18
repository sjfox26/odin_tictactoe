require_relative "../lib/game"
require_relative "../lib/player"
require_relative "../lib/board"

RSpec.describe Game do

  let (:steph) { Player.new({ name: "steph", letter: "X"}) }
  let (:kd) { Player.new({ name: "kd", letter: "O" }) }
  let (:players) { [:steph, :kd]}


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

  context "#send_input_to_be_mapped" do
    it "returns an x and y when given a valid number" do
      game = Game.new(players)
      expect(game.send_input_to_be_mapped("6")).to eq [1,2]
    end

  end



end