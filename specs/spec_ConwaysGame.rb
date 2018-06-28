require './lib/cell.rb'
require "test/unit"

class TestNAME < Test::Unit::TestCase
  def test_sample
    assert_equal(4, 2+2)
  end

  def test_initiliaze_array_size
    cells_array = Array.new
    assert_equal(true,cells_array.empty?)
  end

  def test_check_get_col
    test_cell = GameOfLife::Cell.new
    test_cell.grid
    (0...7).each do |row|
      row = Array.new
        (0...7).each do |cell|
          row.push(0)
        end
        test_cell.grid.push(row)
      end
     assert_equal(7, test_cell.get_col(8))
    assert_equal(0, test_cell.get_col(0))
  end
end
