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

  def change(x, y, letter)
    cell[x][y] = letter
  end

  def winning_combos
    [
        cell[0],     #[1, 2, 3]      #across
        cell[1],     #[4, 5, 6]
        cell[2],     #[7, 8, 9]
        cell.map {|row| row[0]},  #[1, 4, 7]    #down
        cell.map {|row| row[1]},  #[2, 5, 8]
        cell.map {|row| row[2]},  #[3, 6, 9]
        [ cell[0][0], cell[1][1], cell[2][2]],  #[1, 5, 9]    #diagnols
        [ cell[0][2], cell[1][1], cell[2][0]]   #[3, 5, 7]

    ]
  end


  def winner?
    winning_combos.each do |winning_combo|
      return true if winning_combo.uniq.count == 1
    end
    false
  end

  def draw?
    draw_checker = cell.map { |element| element }
    draw_checker.flatten!
    return true if draw_checker.uniq.count == 2
    false
  end

end
