module Maze
  class Board
    attr_accessor :current
    attr_reader :width, :height, :board, :stack, :start, :finish
    attr_accessor :specified_x, :specified_y

    def initialize(w, h)
      @width = w
      @height = h
      @board = []
      generate
      @stack = []
    end

    def display
      puts "start: #{start.x}, #{start.y}" if start
      puts "finish: #{finish.x}, #{finish.y}" if finish
      # Each cell is printed as 9 places on console
      # b─b
      # |■|
      # b─b
      0.upto(height - 1) do |y|
        # Print top edge
        if y.zero?
          0.upto(width - 1) do |x|
            print ' ' if x.zero?
            print '─ '.pale
          end
          puts
        end
        # Print left right edges and the cell
        0.upto(width - 1) do |x|
          print '|'.pale if x.zero? # left wall for the maze
          print print_cell(board[x][y])
          print board[x][y].right == :wall ? '|'.pale : ' '
        end
        puts
        #print bottom edge
        0.upto(width - 1) do |x|
          print ' ' if x.zero? # bottom left corner of each cell in first col
          print board[x][y].bottom == :wall ? '─'.pale : ' '
          print ' ' # bottom right corner of each cell
        end
        puts
      end
    end

    def print_cell(cell)
      if cell == start
        'S'.greenish
      elsif current && cell == current
        '@'.green
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
      def generate
        0.upto(width - 1) do |x|
          board << []
          0.upto(height - 1) do |y|
            board[x][y] = Cell.new(x, y, self)
          end
        end
      end

      def backtrack
        return unless current

        # return if it solved
        (@finish = current) && return if at_the_edge?

        neighbour = current.unvisited_neighbours.sample
        if neighbour
          case neighbour
            when current.north
              current.top = :cell if !current.y.zero?
              neighbour.bottom = :cell if neighbour.y != height
            when current.south
              current.bottom = :cell if current.y != height
              neighbour.top = :cell if !neighbour.y.zero?
            when current.east
              current.left = :cell if !current.x.zero?
              neighbour.right = :cell if neighbour.x != width
            when current.west
              current.right = :cell if current.x != width
              neighbour.left = :cell if !neighbour.x.zero?
          end

          neighbour.visited = true
          stack.push(neighbour)
          @current = neighbour
        else
          current.discarded = true
          @current = stack.pop
        end
        backtrack
      end

      def at_the_edge?
        # This is to give player to set some harder
        # locations to make maze more complicated
        if specified_x
          current.x == specified_x
        elsif specified_y
          current.y == specified_y
        else
          current.x.zero? || current.y.zero? ||
            current.x == width - 1 || current.y == height - 1
        end
      end
    end
end
