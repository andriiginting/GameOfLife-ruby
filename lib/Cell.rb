module GameOfLife
  class Cell
    attr_reader :grid

    def initialize
      @grid = Array.new
    end
end
