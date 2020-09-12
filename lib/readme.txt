    board.grid[1][3] = Pawn.new([1,3], current_player)
    board.grid[2][2] = Pawn.new([2,2], other_player)
    board.grid[2][4] = Pawn.new([2,4], other_player)
    
    board.grid[6][1] = Rook.new([6,1], other_player)
    board.grid[5][3] = Pawn.new([5,3], other_player)
    board.grid[4][1] = Pawn.new([4,1], current_player)
    board.grid[6][3] = Rook.new([6,3], other_player)