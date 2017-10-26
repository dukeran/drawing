# 2d array of elements representing a Cartesian plane
# It's loops and element index commands
# Have a drawing loop that renders the matrix based upon the population of each element
# And the drawing commands just change the state of the matrix elements

class Board
  attr_accessor :grid

  def initialize(x, y)
    @grid = Array.new(y+2) { Array.new(x, " ") }
    @grid.map do |r|
      #sets the side borders
      r[0] = "|"
      r[x-1] = "|"
    end
    #sets the horizontal borders
    @grid[0].map! { |y| y = "-" }
    @grid[y+1].map! { |y| y = "-" }
  end

  def display_board(board)
    #formats display of board
    board.grid.each do |r|
      puts r.each { |p| p }.join("")
    end
  end
end

