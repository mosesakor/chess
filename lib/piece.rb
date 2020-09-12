require_relative './player'
class Piece

  attr_accessor :position, :first_move, :owner
  def initialize(position, owner)
    @position = position
    @first_move = true
    @owner = owner
  end

end