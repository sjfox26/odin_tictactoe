require_relative '../lib/board'

RSpec.describe Board do

  context "#initialize" do
    it "is initialized with a two-dimensional array for board places" do
      board = Board.new
      expect(board.cell).to eq [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]
    end
  end


end