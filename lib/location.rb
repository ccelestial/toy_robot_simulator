class Location
  attr_accessor :x, :y

  def initialize x, y
    @x = x.to_i
    @y = y.to_i
  end
end