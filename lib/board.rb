class Board
  attr_accessor :cell

  def initialize
    @cell = [ [1,2,3], [4,5,6], [7,8,9] ]
  end

  def draw_board
    puts "#{cell[0][0]} | #{cell[0][1]} | #{cell[0][2]}"
    puts "#{cell[1][0]} | #{cell[1][1]} | #{cell[1][2]}"
    puts "#{cell[2][0]} | #{cell[2][1]} | #{cell[2][2]}"
  end

end
