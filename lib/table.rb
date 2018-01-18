class Table
  attr_accessor :matrix

  def initialize height:, width:
    @matrix = Array.new(height) { Array.new(width, 0) }
  end
end