require_relative "position"
require_relative "shared"

module MarsRovers
  class Rover
    attr_reader :position, :direction

    def initialize(initial_point, grid_size)
      position = MarsRovers::Position.create_from_string(initial_point)

      if (!position.on_plateau?(grid_size))
        raise StandardError, "Initial position is out of bounds"
      end

      @position = position
      @direction = initial_point.split(" ")[2]
    end

    def to_s
      "#{@position.x} #{@position.y} #{@direction}"
    end

    def execute(command)
      return turn_left if command == "L"
      return turn_right if command == "R"
      return move if command == "M"

      raise StandardError, "Invalid command received"
    end

    private

    def turn_left
      rotate(3)
    end

    def turn_right
      rotate(1)
    end

    def move
      case @direction
      when MarsRovers::Shared::Bearing.north
        @position = MarsRovers::Position.new(@position.x, @position.y + 1)
      when MarsRovers::Shared::Bearing.east
        @position = MarsRovers::Position.new(@position.x + 1, @position.y)
      when MarsRovers::Shared::Bearing.south
        @position = MarsRovers::Position.new(@position.x, @position.y - 1)
      when MarsRovers::Shared::Bearing.west
        @position = MarsRovers::Position.new(@position.x - 1, @position.y)
      end
    end

    def rotate(rotation_factor)
      idx = MarsRovers::Shared::Compass.index(@direction)

      @direction = MarsRovers::Shared::Compass[(idx + rotation_factor) % 4]
    end
  end
end
