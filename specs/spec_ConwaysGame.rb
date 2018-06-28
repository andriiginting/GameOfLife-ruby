require "./lib/ConwaysGame.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2+2)
  end

  def test_initiliaze_array_size
    cells_array = Array.new
    assert_equal(true,cells_array.empty?)
  end

end
