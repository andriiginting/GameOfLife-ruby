require './lib/cell'

describe "cell" do
  it "initial test" do
  end

  it "can calculate array size" do
    cell_array = Array.new
    expect(cell_array.empty?).to be true
  end

  it "can check get collumn function" do
    test_cell = GameOfLife::Cell.new
    test_cell.grid
    (0...7).each do |row|
      row = Array.new
        (0...7).each do |cell|
          row.push(0)
        end
        test_cell.grid.push(row)
      end
    expect(7).to eq(test_cell.get_col(8))
  end

  it "can check get row function" do
    test_cell = GameOfLife::Cell.new
    test_cell.grid
    (0...7).each do |row|
      row = Array.new
        (0...7).each do |cell|
          row.push(0)
        end
        test_cell.grid.push(row)
      end
    expect(7).to eq(test_cell.get_row(8))
  end

  it "can calculate neighbor " do
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

    expect(3).to eq(test_cell.calculate_neighbor(1, 3, 0, 2, 2, 2))
  end

  it "can check pattern that created " do
    test_cell = GameOfLife::Cell.new
    file_name = "./test_input_file.txt"
    test_cell.create_pattern(file_name)

    arr = [ [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0] ]

    expect(arr).to eq(test_cell.grid)
  end

  it "can check next pattern generation " do
    test_cell = GameOfLife::Cell.new
    file_name = "./test_input_file.txt"
    test_cell.create_pattern(file_name)

    arr = [ [0, 0, 0, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0] ]

    test_cell.next_generation

    expect(arr).to eq(test_cell.grid)
  end

end
