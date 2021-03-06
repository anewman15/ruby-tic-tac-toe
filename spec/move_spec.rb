require_relative '../lib/move.rb'

describe Move do
  let(:move1) { Move.new('Rida', 5) }

  describe '#player' do
    context 'when a move is made' do
      it 'outputs the player name of the move' do
        expect(move1.player).to eq('Rida')
      end

      it 'outputs cell number of the move' do
        expect(move1.cell).to eq(5)
      end
    end
  end

  describe '#winning_move?' do
    context 'when a move is made' do
      it "doesn't return a winning move" do
        expect(move1.winning_move?([move1.cell])).to eq(false)
      end

      it 'returns winning move' do
        expect(move1.winning_move?(%w[1 2 3])).to eq(true)
      end

      it 'draw when the move is not a winning one,and there is no more moves left' do
        expect(!move1.winning_move?([1, 2, 5, 6, 9]) && [].length.zero?).to eq(true)
      end

      it 'not a draw when the move is not a winning one,and there is more moves left' do
        expect(!move1.winning_move?([1, 2, 5, 6, 9]) && [3, 4].length.zero?).to eq(false)
      end
    end
  end
end
