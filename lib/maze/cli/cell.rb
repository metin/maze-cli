module Maze
  class Cell
    attr_accessor :top, :bottom, :left, :right
    attr_accessor :x, :y, :val
    def initialize(x, y)
      @top = 1
      @bottom = 1
      @left = 1
      @right = 1
      @val = "■"
      @x = x
      @y = y
    end
  end
end
  