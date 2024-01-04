class Cell
  attr_reader :coordinate, 
              :ship, 
              :empty, 
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil 
    @empty = true 
    @fired_upon = false 
  end

  def place_ship(vessel)
    @ship = vessel 
    @empty = false 
  end

  def empty?
    @empty 
  end

  def fired_upon?
    @fired_upon 
  end

  def fire_upon
    @fired_upon = true 
    @ship.hit 
  end

  # def render
    
  # end
end
