require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before 'each' do 
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@cell_1).to be_an_instance_of(Cell)
  end

  it 'has readable attributes' do
    expect(@cell_1.coordinate).to eq("B4")
    expect(@cell_1.ship).to eq(nil)

  end

  it 'can #place_ship' do
    expect(@cell_1.empty?).to eq(true)

    @cell_1.place_ship(@cruiser)
    expect(@cell_1.ship).to eq(@cruiser)
    expect(@cell_1.empty?).to eq(false)
  end

  it 'can be #fired_upon' do
    expect(@cell_1.fired_upon?).to eq(false)

    @cell_1.fire_upon

    expect(@cell_1.fired_upon?).to eq(true)
  end

  describe '#render' do
    it 'if fired upon, X is rendered when ship is sunk' do
      expect(@cell_2.render).to eq(".")
      
      @cell_2.place_ship(@cruiser)

      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)
      
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq("X")
    end

    it 'if fired upon, M is rendered when no ship is in cell' do
      @cell_2.place_ship(@cruiser)

      expect(@cell_1.render).to eq(".")
      expect(@cell_2.render).to eq(".")
      
      @cell_1.fire_upon

      expect(@cell_1.render).to eq("M")
      expect(@cruiser.sunk?).to eq(false)
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

    it 'renders . if the cell has not been fired upon' do
      @cell_2.place_ship(@cruiser)

      expect(@cell_1.render).to eq(".")
    end
  end

  it 'can be #fired_upon' do
    expect(@cell.fired_upon?).to eq(false)

    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end

  # describe '#render' do
  #   xit 'renders . if the cell has not been fired upon' do
  #     expect(@).to eq()
  #     expect(@).to eq()
  #     expect(@).to eq()
  #   end
    
  #   xit 'if fired upon, M is rendered when no ship is in cell' do
  #     expect(@).to eq()
  #     expect(@).to eq()
  #     expect(@).to eq()
  #   end

  #   xit 'if fired upon, H is rendered when ship is in cell' do
  #     expect(@).to eq()
  #     expect(@).to eq()
  #     expect(@).to eq()
  #   end

  #   xit 'if fired upon, X is rendered when ship is sunk' do
  #     expect(@).to eq()
  #     expect(@).to eq()
  #     expect(@).to eq()
  #   end
  # end
end




# Additionally, a cell knows when it has been fired upon. When it is fired upon, the cell’s ship should be damaged if it has one:


# Finally, a Cell will have a method called render which returns a String representation of the Cell for when we need to print the board. A cell can potentially be rendered as:

# ”.” if the cell has not been fired upon.
# “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
# “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
# “X” if the cell has been fired upon and its ship has been sunk.
# Additionally, we will include an optional boolean argument to indicate if we want to reveal a ship in the cell even if it has not been fired upon. This should render a cell that has not been fired upon and contains a ship as an “S”. This will be useful for showing the user where they placed their ships and for debugging.

# cell_1 = Cell.new("B4")
# # => #<Cell:0x00007f84f11df920...>

# cell_1.render
# # => "."

# cell_1.fire_upon

# cell_1.render
# # => "M"

# cell_2 = Cell.new("C3")
# # => #<Cell:0x00007f84f0b29d10...>

# cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0ad4fb8...>

# cell_2.place_ship(cruiser)

# cell_2.render
# # => "."

# # Indicate that we want to show a ship with the optional argument
# cell_2.render(true)
# # => "S"

# cell_2.fire_upon

# cell_2.render
# # => "H"

# cruiser.sunk?
# # => false

# cruiser.hit

# cruiser.hit

# cruiser.sunk?
# # => true

# cell_2.render
# # => "X"
