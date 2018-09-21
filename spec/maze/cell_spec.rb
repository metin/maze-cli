RSpec.describe Maze::Cell do
  let(:cell) { Maze::Cell.new(1,2) }
  it "exists " do
    expect(cell).not_to be nil
  end

  it "left can be set " do
    cell.left = 4;
    expect(cell.left).to be 4
  end

end
