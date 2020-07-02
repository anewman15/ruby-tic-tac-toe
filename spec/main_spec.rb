require_relative '../bin/main.rb'

describe 'main' do
  let(:moves) do
    {
      '1' => 'X', '2' => 'O', '3' => 'X',
      '4' => 'O', '5' => 'X', '6' => 'O',
      '7' => 'X', '8' => 'O', '9' => 'X'
    }
  end
  describe 'display_updated_board' do
    it 'output the bored' do
      expect { display_updated_board(moves) }.to output {
                                                   "
                \n===========
                \n| X | O | X |
                \n--- --- ---
                \n| O | X | O |
                \n--- --- ---
                \n| X | O | X |
                \n===========

                "
                                                 }.to_stdout
    end
  end
end
