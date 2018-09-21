RSpec.describe Maze::Board do
    let(:board) { Maze::Board.new }
    it "exists " do
      expect(board).not_to be nil
    end

    it "prints the board" do
      board.generate(10,6);
      board.display
    end
    
  end