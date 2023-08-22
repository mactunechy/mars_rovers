require_relative "../../lib/mars_rovers/position"
require_relative "../../lib/mars_rovers/shared"

module MarsRovers
  describe Position do
    before do
      @position_string = "3 4 N"
      @grid_max_position = MarsRovers::Shared::GridMaxPosition.new(5, 5)
      @position = MarsRovers::Position.create_from_string(@position_string)
    end

    context "Invalid string arg format" do
      it "throws an error" do
        ["0000", "aaaa", "111aaa"].each do |test_case|
          expect { MarsRovers::Position.create_from_string(test_case) }.to raise_error(StandardError, "Invalid position string")
        end
      end
    end

    it "returns a position object" do
      expect(@position.x).to eq(3)
      expect(@position.y).to eq(4)
    end

    it "on_plateau?" do
      test_cases = [
        {
          plateau_max_position: MarsRovers::Shared::GridMaxPosition.new(-1, -1),
          expected: false,
        },
        {
          plateau_max_position: MarsRovers::Shared::GridMaxPosition.new(2, 2),
          expected: false,
        },
        {
          plateau_max_position: MarsRovers::Shared::GridMaxPosition.new(5, 5),
          expected: true,
        },
      ].each do |test_case|
        expect(@position.on_plateau?(test_case[:plateau_max_position])).to eq(test_case[:expected])
      end
    end
  end
end
