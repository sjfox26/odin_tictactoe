class Game
  attr_reader :players, :current_player, :other_player, :board

  def initialize(players)
    @players = players
    @current_player, @other_player = players.shuffle
    @board = Board.new
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end
end
