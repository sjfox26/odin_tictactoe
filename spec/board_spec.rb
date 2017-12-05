require_relative '../lib/board'

RSpec.describe Board do

  context "#initialize" do
    it "is initialized with a two-dimensional array for board places" do
      board = Board.new
      expect(board.cell).to eq [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]
    end
  end

  context "#draw_board" do
    it "draws the game board for players to view" do
      board = Board.new
      matrix_format_str = "1 | 2 | 3\n4 | 5 | 6\n7 | 8 | 9\n"
      expect { board.draw_board }.to output(matrix_format_str).to_stdout
    end
  end

  context "#change" do
    it "will change selected spot to @current_player's letter" do
      board = Board.new
      x, y = 0, 1
      board.change(x, y, "X")
      expect(board.cell).to eq [ [1, "X", 3], [4, 5, 6], [7, 8, 9] ]
    end
  end

  context "#winner?" do
    it "will return true if top row is all one letter" do
      board = Board.new
      board.cell = [["X", "X", "X"], ["O", "O", 6], [7, 8, 9]]
      expect(board.winner?).to be_truthy
    end

    it "will return true if middle row is all one letter" do
      board = Board.new
      board.cell = [["X", 2, "X"], ["O", "O", "O"], [7, 8, 9]]
      expect(board.winner?).to be_truthy
    end

    it "will return true if bottom row is all one letter" do
      board = Board.new
      board.cell = [[1, 2, 3], ["O", "O", 6], ["X", "X", "X"]]
      expect(board.winner?).to be_truthy
    end

    it "will return true if left column is all one letter" do
      board = Board.new
      board.cell = [["X", "O", "O"], ["X", "O", 6], ["X", 8, 9]]
      expect(board.winner?).to be_truthy
    end

    it "will return true if middle column is all one letter" do
      board = Board.new
      board.cell = [["X", "O", "O"], ["X", "O", 6], [7, "O", "X"]]
      expect(board.winner?).to be_truthy
    end

    it "will return true if right column is all one letter" do
      board = Board.new
      board.cell = [[1, "O", "X"], ["X", "O", "X"], ["O", 8, "X"]]
      expect(board.winner?).to be_truthy
    end


    it "will return true if diagnol top left to bottom right is all one letter" do
      board = Board.new
      board.cell = [["X", "O", "O"], ["O", "X", 6], ["X", 8, "X"]]
      expect(board.winner?).to be_truthy
    end

    it "will return true if diagnol top right to bottom left is all one letter" do
      board = Board.new
      board.cell = [["X", "X", "O"], ["O", "O", 6], ["O", 8, "X"]]
      expect(board.winner?).to be_truthy
    end

    it "will return false if no winner is reached" do
      board = Board.new
      board.cell = [["X", "O", "X"], ["X", "O", 6], ["O", "X", "O"]]
      expect(board.winner?).to be_falsey
    end
  end

end