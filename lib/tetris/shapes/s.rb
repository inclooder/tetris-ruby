module Tetris
  module Shapes
    class S < Base
      def parts
        @parts ||= make_parts
      end

      private

      def make_parts
        s = Config.square_size
        [
          Part.new(0, 0),
          Part.new(0, 1),
          Part.new(1, 1),
          Part.new(2, 1)
        ]
      end
    end
  end
end
