class Queen < Piece

  def available_moves(board)
    # vertical and horizontal moves
    negatives = Array(-7..-1).reverse
    positives = Array(1..7)

    # digagonal moves
    backward_up = [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
    backward_down = [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]

    forward_up = [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
    forward_down = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]


    vertical_horizontal = vertical_moves(board, negatives) + vertical_moves(board, positives) +
                          horizontal_moves(board, negatives) + horizontal_moves(board, positives)

    diagonal = diagonal(board, forward_up) + diagonal(board,forward_down) +
               diagonal(board, backward_up) + diagonal(board, backward_down)

    vertical_horizontal + diagonal
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