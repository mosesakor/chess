require_relative './player'
require_relative './board'
require_relative './rook'
require_relative './bishop'
require_relative './queen'
#require_relative './test_script'

class Game

  attr_accessor :board, :current_player, :other_player
  def initialize(player, board = Board.new)
    @board = board
    @current_player = player[0]
    @other_player = player[1]
  end

  def generate_pawns(row, player)
    index = 0
    list = []

    while index < 8
      list << Pawn.new([row, index], player)
      index += 1
    end
  end

  def generate_other_pieces(row, player)
    [Bishop.new([row, 0], player), Knight.new([row, 1], player),
                Rook.new([row, 2], player), King.new([row, 3], player),
                Queen.new([row, 4], player), Rook.new([row, 5], player),
                Knight.new([row, 6], player), Bishop.new([row, 7], player)
    ]
  end

  def fill_board_with_pieces
    board[0] = generate_other_pieces(0, current_player)
    board[1] = generate_pawns(1, current_player)
    board[7] = generate_other_pieces(7, other_player)
    board[6] = generate_pawns(6, other_player)
  end

  def test_board

    board.grid[4][4] = Queen.new([4,4], current_player)
  end

  def test_pawn
    #board.grid[1][3].available_moves(board.grid)
    board.grid[4][4].available_moves(board.grid)
  end

  def display_board
    #board.grid[6][3]
  end

  def change_turn
    @current_player, @other_player = @other_player, @current_player
  end

end
players = []
player1 = Player.new({name: 'moe', color: 'black'})
player2 = Player.new({name: 'rita', color: 'white'})
players << player1
players << player2

test = Game.new(players)
test.test_board
p test.test_pawn
p test.display_board
