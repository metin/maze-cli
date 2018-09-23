RSpec.describe Maze::Board do
  let(:with) { 10 }
  let(:height) { 6 }
  let(:maze) { Maze::Board.new(with, height) }
  it "exists " do
    expect(maze).not_to be nil
  end

  it "displays the maze" do
    maze.display
  end

  describe :cell do
    it "returns cell if in the bounds" do
      expect(maze.cell(2, 2)).not_to eq(nil)
    end

    it "returns nil if not in the bounds" do
      expect(maze.cell(with, height)).to eq(nil)
    end
    
    it "returns nil if not in the bounds" do
      expect(maze.cell(2, 200)).to eq(nil)
    end
  end

  describe :print_cell do
    it "marks current cell with ■" do
      cell = maze.cell(5, 5)
      maze.current = cell
      expect(maze.print_cell(cell)).to eq("■")
    end

    it "marks any other cell with cells display method" do
      cell = maze.cell(1, 2)
      expect(maze.print_cell(cell)).to eq(" ")
    end
  end



end