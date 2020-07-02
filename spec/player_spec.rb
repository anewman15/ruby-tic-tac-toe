require_relative '../lib/player.rb'

describe Player do
  let(:player) { Player.new('rida') }
  describe 'create_player' do
    it 'create player' do
      expect(player.name).to eq('rida')
    end
  end
end
