require 'spec_helper'
require 'robot_core'
require 'table'

describe RobotCore do
  context ".new" do
    let(:table) { Table.new(height: 5, width: 5) }

    it "should output 3,3,NORTH" do
      expect do
        RobotCore.new("PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT", table).start
      end.to output("3,3,NORTH\n").to_stdout
    end
  end
end
