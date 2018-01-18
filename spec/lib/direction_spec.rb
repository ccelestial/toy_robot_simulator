require 'spec_helper'
require 'direction'

describe Direction do
  describe '.new default' do
    let(:direction) { Direction.new }

    it 'creates a new direction that facing NORTH by default' do
      expect(direction.facing).to eq("NORTH")
    end

    context '.left!' do
      let(:direction) { Direction.new }

      it 'should be facing EAST from default NORTH' do
        direction.left!

        expect(direction.facing).to eq("WEST")
      end
    end

    context '.right!' do
      let(:direction) { Direction.new }

      it 'should be facing EAST from default NORTH' do
        direction.right!

        expect(direction.facing).to eq("EAST")
      end
    end
  end

  describe '' do
    let(:facing_options) { Direction::FACING_OPTIONS }
    let(:left_hash){  { "NORTH": "WEST", "EAST": "NORTH", "SOUTH": "EAST", "WEST": "SOUTH" } } 
    let(:right_hash){ { "NORTH": "EAST", "EAST": "SOUTH", "SOUTH": "WEST", "WEST": "NORTH" } }

    it 'should return new base on set facing' do
      facing_options.each do |facing_option|
        direction = Direction.new(facing: facing_option)

        expect(direction.facing).to eq(facing_option)
      end
    end

    it 'should corresponding direction on left!' do
      facing_options.each do |facing_option|
        direction = Direction.new(facing: facing_option)

        direction.left!

        expect(direction.facing).to eq(left_hash[facing_option.to_sym])
      end
    end

    it 'should corresponding direction on right!' do
      facing_options.each do |facing_option|
        direction = Direction.new(facing: facing_option)

        direction.right!

        expect(direction.facing).to eq(right_hash[facing_option.to_sym])
      end
    end
  end
end