class Ship 
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name 
    @length = length 
    @health = 3
    @sunk = false 
  end

  def sunk?
    # @sunk
    if @health == 0
      @sunk = true 
    else 
      @sunk 
    end
  end

  def hit
    @health -= 1
  end

end
