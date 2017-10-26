require "./board.rb"
require "./draw_program.rb"
require "test/unit"

class DrawProgramTest < Test::Unit::TestCase
	include DrawProgram

  def test_horizontal_lines
    reply = ["L",1,2,6,2]
    assert_equal(true, line_is_horizontal?(reply))

    reply = ["L",1,23,6,2]
    assert_equal(false, line_is_horizontal?(reply))
  end

  def test_draw_horizontal_line
  	board = Board.new(4, 1)
  	reply = ["L",1,1,2,1]
  	assert_equal([["-", "-", "-", "-"], ["|", "x", "x", "|"], ["-", "-", "-", "-"]], draw_horizontal_line(reply, board) )
  end

  def test_vertical_lines
    reply = ["L",1,2,1,3]
    assert_equal(true, line_is_vertical?(reply))

    reply = ["L",1,23,6,2]
    assert_equal(false, line_is_vertical?(reply))
  end

  def test_draw_vertical_line
  	board = Board.new(3, 2)
  	reply = ["L",1,1,1,2]
  	assert_equal([["-", "-", "-"], ["|", "x", "|"], ["|", "x", "|"], ["-", "-", "-"]], draw_vertical_line(reply, board) )
  end

  def test_command_is_a_rectangle?
    reply = ["R",6,3,1,4]
    assert_equal(true, command_is_a_rectangle?(reply))

    reply = ["L",1,23,6,2]
    assert_equal(false, command_is_a_rectangle?(reply))
  end

  def test_draw_a_rectangle
  	board = Board.new(5, 5)
  	reply = ["R",1,2,3,4]
  	assert_equal([["-", "-", "-", "-", "-"],["|", " ", " ", " ", "|"],["|", "x", "x", "x", "|"],["|", "x", " ", "x", "|"],
  		["|", "x", "x", "x", "|"],["|", " ", " ", " ", "|"],["-", "-", "-", "-", "-"]], draw_a_rectangle(reply, board) )
  end

  def test_fill_canvas?
    reply = ["B",6,3,"o"]
    assert_equal(true, fill_canvas?(reply))

    reply = ["L",1,23,6,2]
    assert_equal(false, fill_canvas?(reply))
  end

  def test_fill_the_canvas
  	board = Board.new(3, 3)
  	reply = ["B",1,1,"o"]
  	assert_equal([["-", "-", "-"], ["|", 0, "|"], ["|", 0, "|"], ["|", 0, "|"], ["-", "-", "-"]], fill_the_canvas(reply, board) )
  end
end

