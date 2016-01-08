require_relative 'tile.rb'

class Board

  attr_reader :grid

  def initialize(size)
    @size = size
    @grid = Array.new(size){Array.new(size)}
    @total_bombs = (size ** 2) / 3
  end

  def populate
    super_duper_bomb_array = bomb_shuffle
    grid.each_with_index do |_,row|
      grid[row].each_with_index do |_,col|
        bomb_status = super_duper_bomb_array.shift
        pos = [row,col]
        grid[row][col] = Tile.new(self, pos, bomb_status)
      end
    end
  end

  def [](pos)
    x,y = pos[0],pos[1]
    grid[x][y]
  end

  def []=(pos,value)
    x,y = pos[0],pos[1]
    grid[x][y] = value
  end

  def bomb_shuffle
    result = Array.new(@size ** 2, false)
    @total_bombs.times {|i| result[i] = true}
    result.shuffle
  end

end
