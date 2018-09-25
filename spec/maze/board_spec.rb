RSpec.describe Maze::Board do
  let(:with) { 40 }
  let(:height) { 26 }
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
    it "marks current cell with @" do
      cell = maze.cell(5, 5)
      maze.current = cell
      expect(maze.print_cell(cell)).to include("@")
    end

    it "marks any other cell with cells display method" do
      cell = maze.cell(1, 2)
      expect(maze.print_cell(cell)).to eq(" ")
    end
  end

  describe :solve do
    it "solves a maze randomly for any given starting point" do
      start = maze.cell(20, 13)
      maze.solve(start)
      maze.display
    end
  end

  describe :solved? do
    it "is not solved initally" do
      expect(maze.solved?).to be false
    end

    it "is solved if finish has a value" do
      start = maze.cell(4,3)
      maze.solve(start)
      expect(maze.solved?).to be true
    end

    it "is solved at the specified y locations" do
      start = maze.cell(2,1)
      maze.specified_x = 39
      maze.solve(start)
      maze.display
      expect(maze.finish.x).to eq 39
    end
  end

end
