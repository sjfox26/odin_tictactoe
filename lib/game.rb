require_relative 'board'
require_relative 'player'

class Game
  attr_reader :players, :current_player, :other_player, :board
  def initialize(players)
    @players = players
    @current_player, @other_player = choose_random_player(players)
    @board = Board.new
  end

  def choose_random_player(players)
    @current_player, @other_player = players.shuffle
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end


  def send_input_to_be_mapped(player_input = gets.chomp)

    number_chosen = player_input.to_i

    loop do
      break if number_chosen.between?(1,9)
      puts "Invalid Move! Please enter an unused number, 1-9"
      player_input = gets.chomp
      number_chosen = player_input.to_i
      break if number_chosen.between?(1,9)
    end

    get_coordinates(player_input)
  end

  def get_coordinates(player_input)
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
    mapping[player_input]   #returns an x and y
  end


  def play
    puts "Welcome to Tic Tac Toe!\n\n"
    puts "#{current_player.name}, you've been selected to go first. To make your move, enter an unused number 1-9.\n\n"

    while true
      board.draw_board
      puts ""
      x, y = send_input_to_be_mapped
      while board.spot_taken?(x, y)
        x, y = send_input_to_be_mapped
      end
      board.change(x, y, current_player.letter)
      puts ""
      if board.winner?
        puts "#{current_player.name} wins!"
        return
      elsif board.draw?
        puts "Cat's Game!"
        return
      else
        switch_players
        puts "#{current_player.name}, your turn now.\n\n"
        puts "To make your move, enter an unused number 1-9.\n"
      end
    end
  end
end

player1 = Player.new({name: 'Lebron James', letter: 'X'})
player2 = Player.new({name: 'Kevin Durant', letter: 'O'})
matchup = [player1, player2]

game = Game.new(matchup)
game.play

