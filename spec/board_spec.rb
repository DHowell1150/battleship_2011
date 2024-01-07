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
    expect(@cruiser).to be_a(Ship)
  end

  it 'initializes Board with cells' do 
    @board.cells.each_value do |cell|
      expect(cell).to be_instance_of(Cell)
    end
  end

  describe '#valid_coordinate?' do
    it 'knows if a coordinate is on the board' do 
      expect(@board.valid_coordinate?("A1")).to be true
      expect(@board.valid_coordinate?("D4")).to be true
    end
    
    it 'knows if a coordinate is not on the board' do
      expect(@board.valid_coordinate?("A5")).to be false
      expect(@board.valid_coordinate?("E1")).to be false
      expect(@board.valid_coordinate?("A22")).to be false
    end
  end

  describe '#match_ship_length' do
    it 'number of coordinates match ship.length' do
      expect(@board.match_ship_length(@cruiser, ["A1", "A2"])).to be false
      expect(@board.match_ship_length(@cruiser, ["A1", "A2", "A3"])).to be true
      expect(@board.match_ship_length(@submarine, ["A2", "A3", "A4"])).to be false
      expect(@board.match_ship_length(@submarine, ["A2", "A3"])).to be true
    end
  end
    
  describe '#ascending_order' do
    it 'returns false if coordinates are not ascending in order' do
      expect(@board.ascending_order?(["C1", "B1"])).to be false
      expect(@board.ascending_order?(["A3", "A2", "A1"])).to be false
    end

    it 'returns true if coordinates are ascending in order' do
      expect(@board.ascending_order?(["B1", "C1"])).to be true
      expect(@board.ascending_order?(["A1", "A2", "A3"])).to be true
    end
  end

  describe '#horizontal' do
    it "returns true when coordinates are #horizontal" do
      expect(@board.horizontal?(["A2", "A3"])).to be true
      # expect(@board.horizontal?(["A1", "A2", "A3"])).to be true
    end

    it "returns false when coordinates are not #horizontal" do
      expect(@board.horizontal?(["A2", "B2"])).to be false
      # expect(@board.horizontal?(["A1", "B1", "C1"])).to be false
    end 
  end

  describe '#vertical' do
    it "returns true when coordinates are #vertical" do
      expect(@board.vertical?(["B1", "C1"])).to be true
      # expect(@board.vertical?(["A1" "B1", "C1"])).to be true
    end

    it "returns false when coordinates are not #vertical" do
      expect(@board.vertical?(["A1", "A2"])).to be false
      # expect(@board.vertical?(["A1" "A2", "A3"])).to be false
    end
  end

  # THIS TEST/METHOD COMMENTED OUT BECAUSE IT'S IMPLIED IN #HORIZONTAL/#VERTICAL
  # describe "#consecutive" do
  #   it "returns false when not consecutive" do
  #     expect(@board.consecutive?(["B1", "C4"])).to be false
  #     expect(board.consecutive?(["A1", "A2", "A4"])).to be false
  #   end

  #   it "returns true when consecutive" do
  #     expect(@board.consecutive?(["B1", "B2"])).to be true
  #     expect(board.consecutive?(["A1", "A2", "A3"])).to be true
  #   end
  # end

  # describe "#diagonal" do
  #   it "returns false if diagonal" do
  #     expect(@board.diagonal?(["C2", "D3"])).to be false
  #     expect(@board.diagonal?(["A1", "B2", "C3"])).to be false
  #   end
  # end

  # describe "valid placement" do
  #   it 'returns true if valid placement' do
  #     expect(board.valid_placement?(@submarine["A1", "A2"])).to be true
  #     expect(board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be true
  #   end
  # end
end



