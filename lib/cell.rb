class Cell
  attr_reader :coordinate, 
              :ship

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
    if !empty? 
      @ship.hit 
    end
  end

  def render
    # if (fired_upon?) && (!empty?) && (@ship.sunk?)
    #   "S"
    if !empty? && (fired_upon?) && @ship.sunk?
      "X"
    elsif empty? && (fired_upon?)
      "M"
    elsif !empty? && (fired_upon?)
      "H"
    else
      "."
    end
  end
end
