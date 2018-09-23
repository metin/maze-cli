RSpec.describe Maze::Cell do
  let(:cell) { Maze::Cell.new(1,2) }
  it "exists " do
    expect(cell).not_to be nil
  end

  it "left can be set " do
    cell.left = 4;
    expect(cell.left).to be 4
  end

  describe "==" do
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

  describe "to_s" do
    it "describes cell" do
      expect(cell.to_s).to eq %{x: #{cell.x} y: #{cell.y} visited: #{cell.visited} edges: [#{cell.left}, #{cell.top}, #{cell.right}, #{cell.bottom}]}
    end
  end

  describe :neighbours do
    let(:board) { Maze::Board.new(10, 6) }
    describe "when cell is in not in the edge" do
      let(:cell) { Maze::Cell.new(1 , 2, board) }
      it "has all 4 neighbours" do
        expect(cell.neighbours.any?{|c| c == nil}).to be false
      end
    end
    describe "when cell is at the north edge" do
      let(:cell) { Maze::Cell.new(1 , 0, board) }
      it "has all 3 neighbours" do
        expect(cell.neighbours.select{|c| c != nil}.size).to eq 3
      end
    end
  end

  describe :unvisited_neighbours do
    let(:board) { Maze::Board.new(10, 6) }
    let(:cell) { Maze::Cell.new(2 , 2, board) }

    describe "when none of neigbours are not visited" do
      it "has 4 unvisited neighbours" do
        expect(cell.unvisited_neighbours.size).to eq 4
      end
    end

    describe "when north neigbours is visited" do
      before do
        cell.north.visited = true
      end
      it "has 3 unvisited neighbours" do
        expect(cell.unvisited_neighbours.size).to eq 3
      end
    end
  end

  describe :display do
    describe "when it is discarded" do
      before { cell.discarded = true }
      it "displays as x" do
        expect(cell.display).to eq "x"
      end
    end
    describe "when it is visited" do
      before { cell.visited = true }
      it "displays as ■" do
        expect(cell.display).to eq "■"
      end
    end
  end

end
