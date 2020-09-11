RSpec.describe '#Player' do

  context '#initialize' do
    it 'initializes a player with a name' do
      input = { name: 'rob', color: 'black'}
      player = Player.new(input)
      expect(player.name).to eq('rob')
    end

    it 'initializes a player with a disc' do
      input = { name: 'rob', color: 'black'}
      player = Player.new(input)
      expect(player.color).to eq('black')
    end
  end
end
