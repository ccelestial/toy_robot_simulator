require_relative 'lib/table'
require_relative 'lib/robot_core.rb'

table = Table.new(height: 5, width: 5)

puts "Give command: e.g. PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT"

user_command = gets.chomp

robot_core = RobotCore.new(user_command, table)
robot_core.start