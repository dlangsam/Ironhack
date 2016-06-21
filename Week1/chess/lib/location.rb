class Location
  attr_accessor :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def distance(new_location)
    {
      :x => new_location.x - @x,
      :y => new_location.y - @y
    }
  end
end
