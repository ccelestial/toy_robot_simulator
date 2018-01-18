require_relative "command"
require_relative "status"

class RobotCore
  attr_accessor :status, :command_str

  def initialize command_str, table
    @command_str = command_str.upcase
    @table = table
    @status = Status.new
  end

  def start
    commands = @command_str.split(" ")

    i = 0
    while (i < commands.count) do
      command_name = commands[i]
      args = ""

      if command_name == "PLACE"
        args = commands[i + 1]
        i += 1
      end

      command = Command.new(name: command_name, args: args)
      @status = command.execute(@status, @table)

      i += 1
    end
  end
end