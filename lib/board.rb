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
    length_valid?(ship, coordinates) && consecutive_placement?(coordinates) 
  end
  
  def length_valid?(ship, coordinates)
    ship.length == coordinates.length
  end

  def consecutive_placement?(coordinates)
    horizontal?(coordinates) || vertical?(coordinates)
  end

  def same_letter?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate.chr 
    end
    
    if letters.uniq.count == 1
      true
    else 
      false
    end
  end

  def horizontal?(coordinates)
    #still need to test for @cruiser
    #evaluates that submarine coordinates are consecutive horizontally eg ["A1", "A2", "A3"]
    first_coord_num_plus_one = coordinates[0][1].to_i + 1  # 1 + 1
    second_coord_num = coordinates[1][1].to_i              # 2
    second_coord_num_plus_one = second_coord_num + 1       # 2 + 1

    if coordinates.count == 3         #["A1", "A2", "A3"]
      third_coord_num = coordinates[2][1].to_i             # 3
      if (first_coord_num_plus_one == second_coord_num) && (second_coord_num_plus_one == third_coord_num) && same_letter?(coordinates)
        true
      else
        false
      end
    elsif coordinates.count == 2       #[A1, A2]
      if (first_coord_num_plus_one == second_coord_num) && same_letter?(coordinates)  
        true
      else
        false
      end
    end
  end 

  def same_number?(coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[-1]
    end

    if numbers.uniq.count == 1
      true
    else 
      false
    end
  end

  def vertical?(coordinates) #["B1", "C1", "D1"]
    first_coord_letter_plus_one = coordinates[0][0].ord + 1
    second_coord_letter = coordinates[1][0].ord
    second_coord_letter_plus_one = second_coord_letter + 1
    if coordinates.count == 2
      if ((first_coord_letter_plus_one == second_coord_letter)   &&  same_number?(coordinates))
        true
      else
        false
      end
    elsif coordinates.count == 3
      third_coord_letter = coordinates[2][0].ord
      if ((first_coord_letter_plus_one ==  second_coord_letter && (second_coord_letter_plus_one == third_coord_letter)) &&  same_number?(coordinates))
        true
      else
        false
      end
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
    require 'pry' ; binding.pry
    end
  end
end

