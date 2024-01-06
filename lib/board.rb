class Board
  attr_reader :cells
  #This is a constant
  BOARD_POSITIONS = ["A1", "A2", "A3", "A4",
                      "B1", "B2", "B3", "B4",
                      "C1", "C2", "C3", "C4",
                      "D1", "D2", "D3", "D4"]
  
  def initialize
    @cells = load_cells
  end

  #Creates Board's cells and assigns them a position
  #Will return the hash in the interaction pattern
  def load_cells
    #Iterate over B_P to create the hash.
    cell_coordinates = Hash.new
    BOARD_POSITIONS.each do |coordinate|
      cell_coordinates[coordinate] = Cell.new(coordinate)
    end
    cell_coordinates
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    
    require 'pry' ; binding.pry
    match_ship_length

    # coordinates 
  end
  
  def match_ship_length
    ship.length == coordinates.length
  end

  def coord_consecutive?

  end
  #Helper methods for:
  #consecutive?
  #diagonal
  #
end
