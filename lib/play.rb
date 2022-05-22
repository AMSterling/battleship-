require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/start_screen'

class Play

  def initialize
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  end

  start_screen

end
