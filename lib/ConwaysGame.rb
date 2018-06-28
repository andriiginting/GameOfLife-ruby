require './lib/cell.rb'

module GameOfLife
  def run_game_of_life
    conway =Cell.new
    filename = "./"
    filename += ARGV[0]
    conway.create_pattern(filename)
    for i in 0..9 do
        conway.next_generation
        print_new_generation(conway.grid)
        sleep(1)
    end
  end

  def print_new_generation(block)
    cells = Array.new(block.length){Array.new(block[0].length)}

    for i in 0..block.length - 1 do
      for j in 0..block[0].length - 1 do 
        if block[i][j] == 0
          cells[i][j] = " "
        else
          cells[i][j] = "x"
        end 
      end
    end

    for i in 0..block.length - 1 do
      puts cells[i].join(" ")
    end
    puts ""
  end
end

include GameOfLife
run_game_of_life()