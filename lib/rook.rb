require_relative './player'
require_relative './piece'

class Rook < Piece

  def available_moves(board)
    negatives = Array(-7..-1).reverse
    positives = Array(1..7)

    vertical_moves(board, negatives) + vertical_moves(board, positives) +
      horizontal_moves(board, negatives) + horizontal_moves(board, positives)
  end

  def vertical_moves(board, coordinates)
    possible_moves = []
    coordinates.each do |coordinate|
      break if position[0] + coordinate < 0 || position[0] + coordinate > 7
      if board[position[0] + coordinate][position[1]] == ' '
        possible_moves << [position[0] + coordinate, position[1]]
      elsif board[position[0] + coordinate][position[1]].owner == self.owner
        break
      elsif board[position[0] + coordinate][position[1]].owner != self.owner
        possible_moves << [position[0] + coordinate, position[1]]
        break
      end
    end
    possible_moves
  end

  def horizontal_moves(board, coordinates)
    possible_moves = []
    coordinates.each do |coordinate|
      break if position[1] + coordinate < 0 || position[1] + coordinate > 7
      if board[position[0]][position[1] + coordinate] == ' '
        possible_moves << [position[0], position[1] + coordinate]
      elsif board[position[0]][position[1] + coordinate].owner == self.owner
        break
      elsif board[position[0]][position[1] + coordinate].owner != self.owner
        possible_moves << [position[0], position[1] + coordinate]
        break
      end
    end
    possible_moves
  end

end