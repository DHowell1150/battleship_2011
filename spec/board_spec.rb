require './lib/board'
require './lib/ship'

RSpec.describe Board do
  before 'each' do 
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'has readable attributes' do #What is tabbing for a hash supposed to look like here?
  expect(board.cells).to eq({
      "A1" => #<Cell:0x00007ff0728a3f58...>,
      "A2" => #<Cell:0x00007ff0728a3ee0...>,
      "A3" => #<Cell:0x00007ff0728a3e68...>,
      "A4" => #<Cell:0x00007ff0728a3df0...>,
      "B1" => #<Cell:0x00007ff0728a3d78...>,
      "B2" => #<Cell:0x00007ff0728a3d00...>,
      "B3" => #<Cell:0x00007ff0728a3c88...>,
      "B4" => #<Cell:0x00007ff0728a3c10...>,
      "C1" => #<Cell:0x00007ff0728a3b98...>,
      "C2" => #<Cell:0x00007ff0728a3b20...>,
      "C3" => #<Cell:0x00007ff0728a3aa8...>,
      "C4" => #<Cell:0x00007ff0728a3a30...>,
      "D1" => #<Cell:0x00007ff0728a39b8...>,
      "D2" => #<Cell:0x00007ff0728a3940...>,
      "D3" => #<Cell:0x00007ff0728a38c8...>,
      "D4" => #<Cell:0x00007ff0728a3850...>
      })
  end

  it 'describe #valid_coordinate?' do
    it 'can tell if coordinate is on the board' do
      expect(board.valid_coordinate?("A1")).to be true
      expect(board.valid_coordinate?("D4")).to be true
      expect(board.valid_coordinate?("A5")).to be false
      expect(board.valid_coordinate?("E1")).to be false
      expect(board.valid_coordinate?("A22")).to be false
    end
  end

  it 'describe #valid_placement' do
    it '@ship.length is the same as number of coordinate placements' do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
      
    end

    it 'coordinates are consecutive' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
    end

    it 'coordinates can not be diagonal' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
      
    end

    it 'placement is valid' do
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end
  end
end

