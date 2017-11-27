require_relative '../lib/board'

RSpec.describe Board do

  context "#initialize" do
    it "is initialized with a two-dimensional array for board places" do
      board = Board.new
      expect(board.cell).to eq [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]
    end
  end

  context "#draw_board" do
    it "draws the game board" do
      board = Board.new
      matrix_format_str = "1 | 2 | 3\n4 | 5 | 6\n7 | 8 | 9\n"
      expect { board.draw_board }.to output(matrix_format_str).to_stdout
    end
  end


end