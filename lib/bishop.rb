require_relative './player'
require_relative './piece'

class Bishop < Piece

  def available_moves(board)
    backward_up = [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
    backward_down = [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]

    forward_up = [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
    forward_down = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]

    diagonal(board, forward_up) + diagonal(board,forward_down) +
      diagonal(board, backward_up) + diagonal(board, backward_down)
  end

  def diagonal(board, coordinates)
    possible_moves = []

    coordinates.each do |coordinate|
      break if position[0] + coordinate[0] > 7 || position[0] + coordinate[0] < 0 || position[1] + coordinate[1] > 7 || position[1] + coordinate[1] < 0
      if board[position[0] + coordinate[0]][position[1] + coordinate[1]] == ' '
        possible_moves << [position[0] + coordinate[0], position[1] + coordinate[1]]
      elsif board[position[0] + coordinate[0]][position[1] + coordinate[1]].owner == self.owner
        break
      elsif board[position[0] + coordinate[0]][position[1] + coordinate[1]].owner != self.owner
        possible_moves << [position[0] + coordinate[0], position[1] + coordinate[1]]
        break
      end
    end
    possible_moves
  end
end