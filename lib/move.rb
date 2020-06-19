class Move
  attr_reader :player, :cell

  def initialize(player, cell)
    @player = player
    @cell = cell
  end
end
