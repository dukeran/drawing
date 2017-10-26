require_relative "board"
require "test/unit"

class TestBoard < Test::Unit::TestCase

  def test_initialization
  	# Test if the board is properly initialize
    assert_equal([["-", "-"], ["|", "|"], ["|", "|"], ["-", "-"]], Board.new(2, 2).grid )
  end

  def test_board_structure
  	# This test won't fail, but will show proper structure of board
  	board = Board.new(2, 2)
    assert_equal([["-", "-"], ["|", "|"], ["|", "|"], ["-", "-"]], board.display_board(board) )
    # Test if the canvas can recognize a bucket command
    assert_equal(true, board.bucket?("B") )
  end
end