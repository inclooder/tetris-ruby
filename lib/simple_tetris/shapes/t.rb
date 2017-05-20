module SimpleTetris
  module Shapes
    class T
      def parts
        @parts ||= make_parts
      end

      private

      def make_parts
        [
          Point.new(0, 0),
          Point.new(1, 0),
          Point.new(2, 0),
          Point.new(1, -1)
        ]
      end
    end
  end
end
