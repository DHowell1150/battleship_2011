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

  it '#sunk?' do
    expect(@cruiser.sunk?).to be false
  end

  it '#hit' do
    @cruiser.hit

    expect(@cruiser.health).to eq(2)
      
    @cruiser.hit
    
    expect(@cruiser.health).to eq(1)
  end

  xit 'sinks ship when #hit three times' do

    expect(@cruiser.sunk?).to be false

    @cruiser.hit
    
    expect(@cruiser.sunk?).to be true
  end
end
