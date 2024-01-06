require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before 'each' do 
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'initializes Board with cells' do 
    @board.cells.each_value do |cell|
      expect(cell).to be_instance_of(Cell)
    end
  end

  it 'knows if a coordinate is on the board' do 
    expect(@board.valid_coordinate?("A1")).to be true
    expect(@board.valid_coordinate?("D4")).to be true
    expect(@board.valid_coordinate?("A5")).to be false
    expect(@board.valid_coordinate?("E1")).to be false
    expect(@board.valid_coordinate?("A22")).to be false
  end

  describe '#valid_placement' do 
    it 'number of coordinates match ship.length' do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
    end

    it 'insures the coordinates are consecutive' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])) to be false
      expect(board.valid_placement?(submarine, ["A1", "C1"])) to be false
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])) to be false
      expect(board.valid_placement?(submarine, ["C1", "B1"])) to be false
    end

    it 'insures the coordinates are not diagonal'

    end

  end

end



