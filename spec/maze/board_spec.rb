RSpec.describe Maze::Board do
  let(:with) { 10 }
  let(:height) { 6 }
  let(:board) { Maze::Board.new(with, height) }
  it "exists " do
    expect(board).not_to be nil
  end

  it "display the board" do
    board.generate
    board.display
  end

  describe :print_cell do
    it "marks start cell with s" do
      start_cell =  Maze::Cell.new(0, 0)
      expect(board.print_cell(start_cell)).to eq("s")
    end

    it "marks finish cell with f" do
      finish_cell =  Maze::Cell.new(with, height)
      expect(board.print_cell(finish_cell)).to eq("f")
    end
  end

end