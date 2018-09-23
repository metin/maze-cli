module Maze
  class Cell
    attr_accessor :top, :bottom, :left, :right
    attr_accessor :x, :y, :val, :board, :visited, :discarded
    def initialize(x, y, board = nil)
      @top = 1
      @bottom = 1
      @left = 1
      @right = 1
      @val = " "
      @x = x
      @y = y
      @board = board
      @visited = false
      @discarded = false
    end

    def ==(other)
      return x && y && other && x == other.x && y == other.y
    end
    
    def unvisited_neighbours
      neighbours.select{|n| n && !n.visited }
    end

    def to_s
      "x: #{x} y: #{y} visited: #{visited} walls: [#{left},#{top}, #{right}, #{bottom}]"
    end


    def neighbours
      [west, north, east, south]
    end

    %w{north south east west}.each do |d|
      define_method d do
        neighbour(d.to_sym)
      end
    end

    private
      def neighbour(at)
        case at
          when :north
            y > 0 ? board.cell(x, y - 1) : nil
          when :south
            board.cell(x, y + 1)
          when :east
            x > 0 ? board.cell(x - 1, y) : nil
          when :west
            board.cell(x + 1, y)
        end
      end
  end
end
  