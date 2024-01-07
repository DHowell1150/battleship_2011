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

  def match_ship_length(ship, coordinates)
    ship.length == coordinates.length
  end

  def ascending_order?(coordinates)
    #evaluates for submarine ["B1", "C1"] 
    # (B(66) + 1 == C (67))  &&  (1 == 1)
    if (coordinates[0][0].ord + 1 == coordinates[1][0].ord) && (coordinates[0][1] == coordinates[1][1])
      true
    else 
      false

    #   #evaluate for cruiser ["A1", "A2", "A3"]
    #                   #  "A"66                           "A" 66                      "A" 66                 "1" +1 = 2                           2
    # elsif ((coordinates[0][0].ord + 1 == coordinates[1][0].ord + 1) && (coordinates[1][0].ord + 1 == coordinates[2][0].ord + 1)) && #((coordinates[0][1] + 1 == coordinates[1][1]) &&  (coordinates[1][1] + 1 == coordinates[2][1]))
    #   true
    end
  end

  
#   def horizontal?(coordinates)
#     #still need to test for @cruiser
#     #evaluates that submarine coordinates are consecutive horizontally eg [A1, A2]
#     if (coordinates[0][1] + 1 == coordinates[1][1]) && (coordinate[0][0] == coordinates[1][0])
#       #(1 + 1 == 2) && ("A" == "A")
#       true
#     end
#   end 

#   def vertical?(coordinates)
#     #consecutive letters with same numbers 
#     if (coordinates[0][1] + 1 == coordinates[1][1]) && (coordinate[0][0] == coordinates[1][1])
#       #below is evaluating if they are consecutive vertically
#     elsif (coordinates[0][1] + 1 == coordinates[1][1])
#       true
#     end
#     #What do I need to pass into this to test it
#     #rewrite the test to match this method.
#   end

#   def consecutive?(coordinates)

#   end

#   def diagonal?(coordinates)

#   end

#   #Helper methods for:
#   #ascending order
#   #horizontal
#   #vertical
#   #diagonal
#   #
end

