class Direction
  attr_reader :facing

  FACING_OPTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

  def initialize facing: "NORTH"
    raise StandardError.new unless FACING_OPTIONS.include?(facing)
    @facing = facing
    @facing_index = set_facing_index
  end

  def left!
    change_facing(-1)
  end

  def right!
    change_facing(1)
  end

  private

  def change_facing operation
    facing_count = FACING_OPTIONS.count

    @facing_index = (facing_count + @facing_index + operation) % facing_count
    @facing = FACING_OPTIONS[@facing_index] 
  end

  def set_facing_index
    FACING_OPTIONS.index(@facing)
  end
end