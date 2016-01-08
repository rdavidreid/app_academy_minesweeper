class Tile
  POSSIBLE_MOVES = [[1,1],[1,-1],[-1,1],[-1,-1],[0,1],[1,0],[0,-1],[-1,0]]
  UPPER_LIMIT = 8
  attr_reader :is_bomb, :flagged, :pos, :board
  attr_accessor :value

  #create a "state" hash
  def initialize(board, pos, is_bomb=false)
    @pos = pos
    @board = board
    @is_bomb = is_bomb
    @flagged = false
    @revealed = false
    @value = nil
  end

  def inspect
    @pos.inspect
    is_bomb.inspect
    flagged.inspect
    revealed.inspect
  end

  #maybe add is_bomb logic/check etc.


  def flag
    flagged ? (flagged = false) : (flagged = true)
  end

  #return array of neighbors
  def neighbors
    neighbors = []
    generate_valid_moves.each do |pos|
      neighbors << board[pos]
    end
    neighbors
  end

  def generate_valid_moves
    neighbors = []
    POSSIBLE_MOVES.each do |move|
      neighbors << [(move[0] + pos[0]),(move[1] + pos[1])]
    end
    neighbors.reject{|move| (move.max > UPPER_LIMIT || move.min < 0)}
  end

  def neighbor_bomb_count
    explosive_neighbors = neighbors.select { |neighbor| neighbor.is_bomb}
    explosive_neighbors.length
  end
end
