RSpec.describe Maze::Cell do
  let(:cell) { Maze::Cell.new(1,2) }
  it "exists " do
    expect(cell).not_to be nil
  end

  it "left can be set " do
    cell.left = 4;
    expect(cell.left).to be 4
  end

  describe "#==" do
    it "is the same when x and y are the same" do
      other_cell = Maze::Cell.new(1, 2)
      expect(cell == other_cell).to be true
    end

    it "is not the same when x is not the same" do
      other_cell = Maze::Cell.new(2, 2)
      expect(cell == other_cell).to be false
    end

    it "is not the same when x is not the same" do
      other_cell = Maze::Cell.new(1, 3)
      expect(cell == other_cell).to be false
    end

  end  

end
