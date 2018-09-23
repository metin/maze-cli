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
    end
    private :generate


    def display
      puts "start: #{start.x}, #{start.y}" if start
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

    def solve(start)
      @start = start
      start.visited = true
      @current = start
      stack.push(start)
      backtrack
    end

    def solved?
      finish != nil
    end

    private
      def backtrack
        return if !current

        #return if it solved
        (@finish = current) && return if at_the_edge?

        neighbour = current.unvisited_neighbours.sample
        if neighbour
          case neighbour
          when current.north
            current.top = 0 if current.y != 0
            neighbour.bottom = 0 if neighbour.y != height
          when current.south
            current.bottom = 0 if current.y != height
            neighbour.top = 0 if neighbour.y != 0
          when current.east
            current.left = 0 if current.x != 0
            neighbour.right = 0 if neighbour.x != width
          when current.west
            current.right = 0 if current.x != width
            neighbour.left = 0 if neighbour.x != 0
          end

          neighbour.visited = true;
          stack.push(neighbour)
          @current = neighbour
          backtrack
        else
          current.val = "x"
          current.discarded = true
          @current = stack.pop
          backtrack
        end
      end

      def at_the_edge?
        current.x == 0 || current.y == 0 || current.x == width - 1 || current.y == height - 1
      end

  end
end
