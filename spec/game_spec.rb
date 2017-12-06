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

  context "#get_number_from_player" do
    it "converts choice of '1' to coordinates [0, 0]" do
      game = Game.new(players)
      expect(game.get_number_from_player("1")).to eq [0, 0]
    end

    it "converts choice of '7' to coordinates [2, 0]" do
      game = Game.new(players)
      expect(game.get_number_from_player("7")).to eq [2, 0]
    end

    it "should call get_coordinates if number is in 1-9 range" do
      game = Game.new(players)
      expect(game).to receive(:get_coordinates)

      game.get_number_from_player("9")
    end

    it "rejects any inputs not in 1-9 range" do
      game = Game.new(players)
      matrix_format_str = "Please enter a number 1-9\n"
      expect { game.get_number_from_player("10") }.to output(matrix_format_str).to_stdout
    end
  end



end