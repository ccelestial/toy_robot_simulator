require_relative "location"

class Status
  attr_accessor :location, :direction

  def initialize location: Location.new(0, 0), direction: Direction.new
    @location = location
    @direction = direction
  end
end