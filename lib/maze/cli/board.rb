module Maze
  class Board
    attr_accessor :start, :finish, :current
    attr_accessor :width, :height, :board, :stack

    def initialize(w, h)
      @width = w
      @height = h
      @board = []
      generate
      @stack = []
    end

    def generate
      0.upto(width - 1) do |x|
          board << []
          0.upto(height - 1) do |y|
            board[x][y] = Cell.new(x, y, self)
          end
      end
      @start = cell(0, 0)
      @finish = cell(width, height)

    end
    private :generate


    def display
      # Each cell is printed as 9 places on console
      0.upto(height - 1) do |y|

        # Print top line and
        if y == 0
          0.upto(width - 1) do |x|
            print " " if x == 0 
            print "─ "
          end
          puts
        end
    
        0.upto(width - 1) do |x|
          print "|" if x == 0 #left wall for the maze
          print print_cell(board[x][y])
          print board[x][y].right == 1 ? "|" : " "
        end
        puts
    
        0.upto(width - 1) do |x|
          print " " if x == 0 # bottom left corner of each cell in first col
          print board[x][y].bottom == 1 ? "─" : " "
          print " " # bottom right corner of each cell
        end
        puts
      end
    end

    def print_cell(cell)
      if current && cell == current  
        "■"
      else
        cell.display 
      end
    end

    def cell(x, y)
      board[x] && board[x][y]
    end
    
  end
end
  