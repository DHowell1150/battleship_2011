require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before 'each' do 
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@cell).to be_an_instance_of(Cell)
  end

  it 'has readable attributes' do
    expect(@cell.coordinate).to eq("B4")
    expect(@cell.ship).to eq(nil)

  end

  it 'can #place_ship' do
    expect(@cell.empty?).to eq(true)

    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq(false)
  end

  it 'can be #fired_upon' do
    expect(@cell.fired_upon?).to eq(false)

    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end

  describe '#render' do
    it 'if fired upon, M is rendered when no ship is in cell' do

      expect(@cell_1.render).to eq(".")
      
      @cell_1.fire_upon

      expect(@cell_1.render).to eq("M")
    end
  
    it 'if fired upon, H is rendered when ship is in cell' do
      @cell_2.place_ship(@cruiser)

      # expect(@cell_2.render).to eq(".")
      # # Indicate that we want to show a ship with the optional argument
      # expect(@cell_2.render(true)).to eq("S")

      @cell_2.fire_upon

      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)
    end

    it 'if fired upon, X is rendered when ship is sunk' do
      @cell_2.place_ship(@cruiser)

      expect(@cell_2.render).to eq(".")
      #       # Indicate that we want to show a ship with the optional argument
      # expect(@cell_2.render(true)).to eq("S")
      
      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)
      
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq("X")
    
    it 'renders . if the cell has not been fired upon' do
      expect(@cell_1.render).to eq(".")
    end
      
  end
end









