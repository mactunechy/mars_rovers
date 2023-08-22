module MarsRovers
  class Position
    POSITION_PATTERN = /\A\d+\s+\d+\s+[NEWS]\z/

    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def self.create_from_string(postion)
      if !POSITION_PATTERN.match?(postion)
        raise StandardError, "Invalid position string"
      end

      coordinates = postion.split(" ")

      x_coordinate = coordinates[0].to_i
      y_coordinate = coordinates[1].to_i

      Position.new(x_coordinate, y_coordinate)
    end

    def on_plateau?(plateau_max_position)
      return false if plateau_max_position.x < 0 || plateau_max_position.y < 0

      return false if plateau_max_position.x < @x || plateau_max_position.y < @y
      true
    end
  end
end
