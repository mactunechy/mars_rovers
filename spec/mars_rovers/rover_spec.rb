require_relative "../../lib/mars_rovers/rover"
require_relative "../../lib/mars_rovers/position"
require_relative "../../lib/mars_rovers/shared"

module MarsRovers
  describe Rover do
    before do
      @position_string = "0 0 N"
      @grid_max_position = MarsRovers::Shared::GridMaxPosition.new(5, 5)
      @position = MarsRovers::Position.create_from_string(@position_string)
      @rover = MarsRovers::Rover.new(@position_string, @grid_max_position)
    end

    context "when position is out of the grid" do
      it "throws an error" do
        @grid_max_position.x = -1
        @grid_max_position.y = -1
        expect { MarsRovers::Rover.new(@position_string, @grid_max_position) }.to raise_error("Initial position is out of bounds")
      end
    end

    it "returns a rover object" do
      expect(@rover.position.x).to eq(@position.x)
      expect(@rover.position.y).to eq(@position.y)
      expect(@rover.direction).to eq("N")
    end

    context "execute" do
      it "changes direction accordingly" do
        test_cases = [
          ["1 1 N", "W"],
          ["1 1 W", "S"],
          ["1 1 S", "E"],
          ["1 1 E", "N"],
        ].each do |test_case|
          current, result = test_case
          @rover = MarsRovers::Rover.new(current, @grid_max_position)

          @rover.execute("L")
          expect(@rover.direction).to eq(result)
        end
      end

      it "changes direction accordingly" do
        test_cases = [
          ["1 1 N", "E"],
          ["1 1 E", "S"],
          ["1 1 S", "W"],
          ["1 1 W", "N"],
        ].each do |test_case|
          current, result = test_case
          @rover = MarsRovers::Rover.new(current, @grid_max_position)

          @rover.execute("R")
          expect(@rover.direction).to eq(result)
        end
      end

      it "changes the position's x coordinates accordingly" do
        test_cases = [
          ["1 1 E", 2],
          ["1 1 W", 0],
        ].each do |test_case|
          current, result = test_case
          @rover = MarsRovers::Rover.new(current, @grid_max_position)

          @rover.execute("M")

          expect(@rover.position.x).to eq(result)
        end
      end

      it "changes the position's y coordinates accordingly" do
        test_cases = [
          ["1 1 N", 2],
          ["1 1 S", 0],
        ].each do |test_case|
          current, result = test_case
          @rover = MarsRovers::Rover.new(current, @grid_max_position)

          @rover.execute("M")

          expect(@rover.position.y).to eq(result)
        end
      end
      it "throws if an invalid command is passed" do
        expect { @rover.execute("0") }.to raise_error(StandardError, "Invalid command received")
      end
    end
  end
end
