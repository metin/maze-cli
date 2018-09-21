RSpec.describe Maze::Board do
    let(:board) { Maze::Board.new(10, 6) }
    it "exists " do
      expect(board).not_to be nil
    end

    it "display the board" do
      board.generate
      board.display
    end


  end