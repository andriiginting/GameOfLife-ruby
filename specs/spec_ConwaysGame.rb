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

  def test_cell_check_get_row
    test_cell = GameOfLife::Cell.new
    test_cell.grid
    (0...7).each do |row|
      row = Array.new
        (0...7).each do |cell|
          row.push(0)
        end
        test_cell.grid.push(row)
      end
       
    assert_equal(2, test_cell.get_row(3))
    assert_equal(7, test_cell.get_row(8))
  end

  def test_check_calculate_neighbor
    test_cell = GameOfLife::Cell.new
    test_cell.grid
    (0...4).each do |row|
      row = Array.new
        (0...4).each do |cell|
          row.push(0)
        end
        test_cell.grid.push(row)
    end
     
    test_cell.grid[1][1] = 1
    test_cell.grid[2][1] = 1
    test_cell.grid[3][1] = 1

    assert_equal(3, test_cell.calculate_neighbor(1, 3, 0, 2, 2, 2))

    test_cell.grid[2][2] = 1
    assert_equal(3, test_cell.calculate_neighbor(1, 3, 1, 3, 2, 1))
  end
end
