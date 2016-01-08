class Board

  attr_reader :grid

  def initialize(size)
    @size = size
    @grid = Array.new(size){Array.new(size)}
    end

  def populate

  end

  def [](pos)
    x,y = pos[0],pos[1]
    grid[x][y]
  end

  def []=(pos,value)
    x,y = pos[0],pos[1]
    grid[x][y] = value
  end

end
