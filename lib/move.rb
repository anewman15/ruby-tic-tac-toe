# rubocop:disable Style/For
class Move
  attr_reader :player, :cell

  WINNING_COMBINATIONS = [
    %w[1 2 3],
    %w[4 5 6],
    %w[7 8 9],
    %w[1 4 7],
    %w[2 5 8],
    %w[3 6 9],
    %w[1 5 9],
    %w[3 5 7]
  ].freeze

  def initialize(player, cell)
    @player = player
    @cell = cell
  end

  def winning_move?(player_moves)
    for combination in WINNING_COMBINATIONS
      decision = true if combination == combination & player_moves
    end
    decision
  end
end
# rubocop:enable Style/For
