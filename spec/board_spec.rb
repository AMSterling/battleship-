require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'

  RSpec.describe Board do
    it 'is initializes the Board' do
      board = Board.new

      expect(board).to be_instance_of Board
    end

    it 'has a collection of cells' do
      board = Board.new

      expect(board.cells).to be_instance_of(Hash)
    end

    it 'is a number of cells' do
      board = Board.new

      expect(board.cells.length).to eq(16)
    end

    it 'A1 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be true
    end

    it 'D4 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("D4")).to be true
    end

    it 'A5 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A5")).to be false
    end

    it 'E1 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("E1")).to be false
    end

    it 'A22 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A22")).to be false
    end

    it 'cruiser is an instance of Ship' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(cruiser).to be_instance_of Ship
    end

    it 'submarine is an instance of Ship' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(submarine).to be_instance_of Ship
    end

    it 'cruiser has valid placement?' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
    end

    it 'submarine has valid placement?' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
    end

    it 'selected consecutive cruiser coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
    end

    it 'selected consecutive submarine coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
    end

    it 'has sorted cruiser coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
    end

    it 'has sorted submarine coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
    end

    it 'did not select diagonal cruiser coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A4", "A2"])).to be false

    end

    it 'did not select diagonal submarine coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
    end

    xit 'has valid submarine coordinates' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      submarine = Ship.new(“Submarine”, 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
    end

    it 'has valid cruiser coordinates' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      submarine = Ship.new(“Submarine”, 2)

      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end

    xit 'A1 is instance of Cell' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.cells["A1"]).to be_instance_of Cell
    end

    xit 'A2 is instance of Cell' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.cells["A2"]).to be_instance_of Cell
    end

    xit 'A3 is instance of Cell' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.cells["A3"]).to be_instance_of Cell
    end

    xit 'cell_1 is instance of Ship' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(cell_1.ship).to be_instance_of(Ship)
    end

    xit 'cell_2 is instance of Ship' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(cell_2.ship).to be_instance_of(Ship)
    end

    xit 'cell_3 is instance of Ship' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(cell_3.ship).to be_instance_of(Ship)
    end

    xit 'cell_3 is instance of Ship' do
      board = Board.new
      cruiser = Ship.new(“Cruiser”, 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(cell_3.ship == cell_2.ship).to be true     
    end

    xit 'has valid cruiser coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end

    xit 'is an instance of a cell' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.cells["A1"]).to be_instance_of Cell
    end

end
