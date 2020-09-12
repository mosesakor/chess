require_relative 'player'
require_relative 'board'

class Piece

  attr_accessor :position, :first_move, :owner
  def initialize(position, owner)
    @position = position
    @first_move = true
    @owner = owner
  end

end

class Pawn < Piece
  
  def available_moves(board)
    if self.owner.color == 'black'
      available_moves_black(board)
    else
      available_moves_white(board)
    end
  end


  def available_moves_black(board)
    possible_moves = []
    
    #add the first and second possible moves for pawn
    possible_moves << [position[0] + 2, position[1]] if first_move && board[position[0] + 2][position[1]] == ' '
    possible_moves << [position[0] + 1, position[1]] if board[position[0] + 1][position[1]] == ' '

    if board[position[0] + 1][position[1] - 1] != ' ' && board[position[0] + 1][position[1] - 1].owner != self.owner
      possible_moves << [position[0] + 1, position[1] - 1]
    end

    if board[position[0] + 1][position[1] + 1] != ' ' && board[position[0] + 1][position[1] + 1].owner != self.owner
      possible_moves << [position[0] + 1, position[1] + 1]
    end

    possible_moves
  end

  def available_moves_white(board)
    possible_moves = []

    possible_moves << [position[0] - 2, position[1]] if first_move && board[position[0] - 2][position[1]] == ' '
    possible_moves << [position[0] - 1, position[1]] if board[position[0] - 1][position[1]] == ' '

    if board[position[0] - 1][position[1] - 1] != ' ' && board[position[0] - 1][position[1] - 1].owner != self.owner
      possible_moves << [position[0] - 1, position[1] - 1]
    end
    if board[position[0] - 1][position[1] + 1] != ' ' && board[position[0] - 1][position[1] + 1].owner != self.owner
      possible_moves << [position[0] - 1, position[1] + 1]
    end
    
    possible_moves
  end
end

class Knight < Piece
  def valid_coordinate?(coordinate)
    return true if position[0] + coordinate[0] >= 0 && position[0] + coordinate[0] <= 7 && position[1] + coordinate[1] >= 0 && position[1] + coordinate[1] <= 7

    false
  end

  def available_moves(board)
    possible_moves = []
    knight_moves = [[1, 2], [-1, 2], [1, -2], [-1, -2],
                    [2, 1], [-2, 1], [2, -1], [-2, -1]
    ]

    knight_moves.each do |move|
      if valid_coordinate?(move) && board[position[0] + move[0]][position[1] + move[1]] == ' '
        possible_moves << [position[0] + move[0], position[1] + move[1]]
      elsif valid_coordinate?(move) && board[position[0] + move[0]][position[1] + move[1]].owner != self.owner
        possible_moves << [position[0] + move[0], position[1] + move[1]]
      end
    end
    possible_moves
  end
end


class Bishop < Piece

  def valid_coordinate?(coordinate)
    return true if position[0] + coordinate[0] >= 0 && position[0] + coordinate[0] <= 7 && position[1] + coordinate[1] >= 0 && position[1] + coordinate[1] <= 7

    false
  end

  def left_side(board)
    possible_moves = []
    i = 1
    while true
      break if position[1] - i < 0
      if board[position[0]][position[1] - i] == ' '
        possible_moves << [position[0], position[1] - i]
      elsif board[position[0]][position[1] - i].owner != self.owner
        possible_moves << [position[0], position[1] - i]
      else
        break
      end
      i += 1
    end
    possible_moves
  end

  def right_side(board)
    possible_moves = []
    i = 1
    while true
      break if position[1] + i > 7
      p board[position[0]][position[1] + i].owner if board[position[0]][position[1] + i] != ' '
      if board[position[0]][position[1] + i] == ' '
        possible_moves << [position[0], position[1] + i]
      elsif board[position[0]][position[1] + i].owner == self.owner
        p "hoho"
        break
      elsif board[position[0]][position[1] + i].owner != self.owner
        possible_moves << [position[0], position[1] + i]
      else
        p 'hi'
        break
      end
      i += 1
    end
    p "right_side #{possible_moves}"
    possible_moves 
  end

  def top_side(board)
    possible_moves = []
    i = 1
    while true
      break if position[0] - i < 0
      if board[position[0] - i][position[1]] == ' '
        possible_moves << [position[0] - i, position[1]]
      elsif board[position[0] - i][position[1]].owner != self.owner
        possible_moves << [position[0] - i, position[1]]
      else
        break
      end
      i += 1
    end
    possible_moves
  end

  def bottom_side(board)
    possible_moves = []
    i = 1
    while true
      break if position[0] + i > 7

      if board[position[0] + i][position[1]] == ' '
        possible_moves << [position[0] + i, position[1]]
      elsif board[position[0] + i][position[1]].owner != self.owner
        possible_moves << [position[0] + i, position[1]]
      else
        break
      end
      i += 1
    end
    possible_moves
  end

  def available_moves(board)
   p top_side(board) 
   p bottom_side(board) 
   p left_side(board) 
   right_side(board) 
  end
end



=begin
top_side(board) +
bottom_side(board) +
left_side(board) +
right_side(board) 
=end