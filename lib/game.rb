class Game
  attr_reader :players, :current_player, :other_player, :board

  def initialize(players)
    @players = players
    @current_player, @other_player = choose_random_player(players)
    @board = Board.new
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def choose_random_player(players)
    @current_player, @other_player = players.shuffle
  end

  def get_number_from_player(one_through_nine = gets.chomp)
    get_coordinates(one_through_nine)
  end

  def get_coordinates(one_through_nine)
    mapping = {
        "1" => [0,0],
        "2" => [0,1],
        "3" => [0,2],
        "4" => [1,0],
        "5" => [1,1],
        "6" => [1,2],
        "7" => [2,0],
        "8" => [2,1],
        "9" => [2,2]
    }
    mapping[one_through_nine]   #returns an x and y
  end

end
