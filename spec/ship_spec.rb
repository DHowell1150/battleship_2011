require './lib/ship'
require 'rspec'

RSpec.describe Ship do
  before 'each' do 
    @cruiser = Ship.new("Cruiser", 3)
  end
  it 'exists' do
    expect(@cruiser).to be_an_instance_of(Ship)
  end

  it 'has readable attributes' do
    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  describe '#sunk?' do 
    it 'sinks after three #hit instances' do
    
      expect(@cruiser.sunk?).to be false 
    
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
      expect(@cruiser.sunk?).to be false

      @cruiser.hit
      expect(@cruiser.sunk?).to be true
    end
  end

end
