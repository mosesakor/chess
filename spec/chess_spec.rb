RSpec.describe Game do
  let (:moe) { Player.new(name: 'moe', color: 'white')}
  let (:rita) { Player.new(name: 'rita', color: 'black')}

  context '#initialize' do
    it 'assigns a current player' do
      game = Game.new([moe, rita])
      expect(game.current_player).to eq(moe)
    end

    it 'assings an other player' do
      game = Game.new([moe, rita])
      expect(game.other_player).to eq(rita)
    end
  end

  context '#change_turn' do
    it 'swaps the current player for the other player' do
      game = Game.new([moe, rita])
      game.change_turn
      expect(game.current_player).to eq(rita)
    end
  end
end