require_relative "rover"
require_relative "shared"

module MarsRovers
  class RoverStation
    def initialize(x, y)
      @grid_max_position = MarsRovers::Shared::GridMaxPosition.new(x, y)
      @rovers = []
    end

    def execute_commands(rover, commands)
      commands = commands.split("")
      commands.each do |command|
        rover.execute(command)
      end
      @rovers.push(rover)
    end

    def create_rover(intial_point)
      MarsRovers::Rover.new(intial_point, @grid_max_position)
    end

    def to_s
      @rovers.each_with_index { |rover| rover.to_s }.join("\n")
    end
  end
end
