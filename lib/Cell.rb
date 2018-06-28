module GameOfLife
  class Cell
    attr_reader :grid

    def initialize
      @grid = Array.new
    end

    def get_col(col_index)
      if col_index - 1 >= 0
        min = col_index - 1
      else
        min = col_index
      end
      return min
    end

    def get_max_col(col_index)
      if col_index + 1 < grid[0].length
        max = col_index + 1
      else
        max = col_index
      end
      return max
    end

    def get_max_row(row_index)
      if row_index + 1 < grid.length
        max = row_index + 1
      else
        max = row_index
      end
      return max
    end

    def get_row(row_index)
      if row_index - 1 >= 0
        min = row_index - 1
      else
        min = row_index
      end
      return min
    end
  
    def calculate_neighbor_sum(min_row, max_row, min_col, max_col, row_index, col_index)
      sum = 0
      for i in min_row..max_row 
        for j in min_col..max_col 
          sum += grid[i][j]
        end
      end

      return sum - grid[row_index][col_index]
    end

    def live_through(row_index, col_index)
      min_row = get_row(row_index)
      max_row = get_max_row(row_index)
      min_col = get_col(col_index)
      max_col = get_max_col(col_index)
      result = calculate_neighbor_sum(min_row, max_row, min_col, max_col, row_index, col_index)

      if result > 3 || result < 2
        return 0
      else 
        return 1
      end
    end

    def reproduce(row_index, col_index)
        min_row = get_row(row_index)
        max_row = get_max_row(row_index)
        min_col = get_col(col_index)
        max_col = get_max_col(col_index)
        result = calculate_neighbor_sum(min_row, max_row, min_col, max_col, row_index, col_index)
  
        if result == 3
          return 1
        else 
          return 0
        end
    end

    def create_pattern(file_name)
      File.open(file_name, "r") do |input_file|
        input_file.each_line do |line|
            chars = line.split(",").map(&:strip).map(&:to_i)
            row = Array.new
            for i in 0..chars.length - 1 
                row.push(chars[i])
            end
            @grid.push(row)
        end
      end
    end

    def next_generation
      next_gen = Array.new(@grid.length) {Array.new(@grid[0].length)}
      for i in 0..grid.length - 1  do
        for j in 0..grid[0].length - 1  do
          if @grid[i][j] == 1
            next_gen[i][j] = live_through(i, j)
          else 
            next_gen[i][j] = reproduce(i, j)
          end       
        end
      end
        @grid = next_gen
    end
  end
end

