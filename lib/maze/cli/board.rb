module Maze
  class Board
    attr_accessor :start, :finish
    attr_accessor :width, :height, :board

    def initialize(w, h)
      @width = w
      @height = h
      @board = [] #Array.new(w) { Array.new(h) }
      @start = Cell.new(0, 0)
      @finish = Cell.new(w, h)
      generate
    end

    def generate
      0.upto(width) do |x|
          board << []
          0.upto(height) do |y|
            board[x][y] = Cell.new(x, y)
          end
      end
    end

    def display
      # Each cell is printed as 9 places on console
      0.upto(height) do |y|

        # Print top line and
        if y == 0
          0.upto(width) do |x|
            print " " if x == 0
            print board[x][y].top == 1 ? "─" : " "
            print " "
          end
          puts
        end
    
        0.upto(width) do |x|
          if x == 0
            print board[x][y].left == 1 ? "|" : " "
          end
          print print_cell(board[x][y])
          print board[x][y].right == 1 ? "|" : " "
        end
        puts
    
        0.upto(width) do |x|
          print " " if x == 0
          print board[x][y].bottom == 1 ? "─" : " "
          print " "
        end
        puts
      end
    end

    def print_cell(current_cell)
      if current_cell == start
        "s"
      elsif current_cell == finish  
        "f"
      else
        current_cell.val
      end
    end

  end
end
  