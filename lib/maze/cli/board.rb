module Maze
  class Board
    attr_accessor :start, :end
    attr_accessor :width, :height, :board


    def generate(w, h)
      @width = w
      @height = h
      @board = [] #Array.new(w) { Array.new(h) }

      0.upto(w) do |x|
          @board << []
          0.upto(h) do |y|
            @board[x][y] = Cell.new(x, y)
          end
      end
    end

    def display
      # Each cell is printed as 9 places on console
      0.upto(@height) do |y|
        # Print top line and
        if y == 0
          0.upto(@width) do |x|
            print " " if x == 0
            print @board[x][y].top == 1 ? "─" : " "
            print " "
          end
          puts
        end
    
        0.upto(@width) do |x|
          if x == 0
            print @board[x][y].left == 1 ? "|" : " "
          end
          print @board[x][y].val
          print @board[x][y].right == 1 ? "|" : " "
        end
        puts
    
        0.upto(@width) do |x|
          print " " if x == 0
          print @board[x][y].bottom == 1 ? "─" : " "
          print " "
        end
        puts
      end
    end

  end
end
  