require_relative "status"
require_relative "location"
require_relative "direction"

class Command
  attr_reader :name

  COMMAND_NAMES = ["PLACE", "MOVE", "REPORT", "LEFT", "RIGHT"]

  def initialize name:, args:
    raise "COMMAND `#{name}` not found" unless COMMAND_NAMES.include?(name)
    @name = name
    @args = args

    if name == "PLACE"
      @args = args.split(',')
      raise "INVALID args for `PLACE`" if @args.count != 3
    end
  end

  def execute status, table
    @table = table
    @status = status
    send("#{name.downcase}!")
  end

  private

  def place!
    @status = Status.new(location: Location.new(@args[0], @args[1]), direction: Direction.new(facing: @args[2]))
    @status
  end

  def move!
    new_location = Location.new(@status.location.x, @status.location.y)

    case @status.direction.facing
      when "NORTH"
        new_location.y += 1
      when "EAST"
        new_location.x += 1
      when "SOUTH"
        new_location.y -= 1
      when "WEST"
        new_location.x -= 1
    end
  
    @status.location = new_location if (new_location.x >= 0 && new_location.y >= 0) && @table.matrix[new_location.y][new_location.x] == 0

    @status
  end

  def report!
    puts "#{@status.location.x},#{@status.location.y},#{@status.direction.facing}"
    @status
  end

  def left!
    @status.direction.left!
    @status
  end

  def right!
    @status.direction.right!
    @status
  end
end