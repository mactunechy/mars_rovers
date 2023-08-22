module MarsRovers
  module Shared
    Bearing = Struct.new(:north, :east, :south, :west).new("N", "E", "S", "W")
    Direction = Struct.new(:left, :right).new("left", "right")
    GridMaxPosition = Struct.new(:x, :y)
    Compass = [Bearing.north, Bearing.east, Bearing.south, Bearing.west]
  end
end
