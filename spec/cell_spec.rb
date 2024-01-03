require './lib/ship'
require './lib/cell'

text






# cell = Cell.new("B4")
# # => #<Cell:0x00007f84f0ad4720...>

# cell.coordinate
# # => "B4"

# cell.ship
# # => nil

# cell.empty?
# # => true

# cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>

# cell.place_ship(cruiser)

# cell.ship
# # => #<Ship:0x00007f84f0891238...>

# cell.empty?
# # => false
# Additionally, a cell knows when it has been fired upon. When it is fired upon, the cell’s ship should be damaged if it has one:

# require './lib/ship'
# # => true

# require './lib/cell'
# # => true

# cell = Cell.new("B4")
# # => #<Cell:0x00007f84f0ad4720...>

# cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>

# cell.place_ship(cruiser)

# cell.fired_upon?
# # => false

# cell.fire_upon

# cell.ship.health
# # => 2

# cell.fired_upon?
# # => true
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
