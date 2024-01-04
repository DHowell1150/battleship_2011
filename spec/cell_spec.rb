require './lib/board'


RSpec.describe Cell do
  before 'each' do 
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'has readable attributes' do #What is tabbing for a hash supposed to look like here?
  expect(board.cells).to eq({
      "A1" => #<Cell:0x00007ff0728a3f58...>,
      "A2" => #<Cell:0x00007ff0728a3ee0...>,
      "A3" => #<Cell:0x00007ff0728a3e68...>,
      "A4" => #<Cell:0x00007ff0728a3df0...>,
      "B1" => #<Cell:0x00007ff0728a3d78...>,
      "B2" => #<Cell:0x00007ff0728a3d00...>,
      "B3" => #<Cell:0x00007ff0728a3c88...>,
      "B4" => #<Cell:0x00007ff0728a3c10...>,
      "C1" => #<Cell:0x00007ff0728a3b98...>,
      "C2" => #<Cell:0x00007ff0728a3b20...>,
      "C3" => #<Cell:0x00007ff0728a3aa8...>,
      "C4" => #<Cell:0x00007ff0728a3a30...>,
      "D1" => #<Cell:0x00007ff0728a39b8...>,
      "D2" => #<Cell:0x00007ff0728a3940...>,
      "D3" => #<Cell:0x00007ff0728a38c8...>,
      "D4" => #<Cell:0x00007ff0728a3850...>
      })
  end


end






####

pry(main)> board.valid_coordinate?("A1")
# => true

pry(main)> board.valid_coordinate?("D4")
# => true

pry(main)> board.valid_coordinate?("A5")
# => false

pry(main)> board.valid_coordinate?("E1")
# => false

pry(main)> board.valid_coordinate?("A22")
# => false



