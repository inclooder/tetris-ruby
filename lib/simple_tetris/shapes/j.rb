module SimpleTetris
  module Shapes
    class J
      def parts
        @parts ||= make_parts
      end

      private

      def make_parts
        [
          Point.new(0, 0),
          Point.new(1, 0),
          Point.new(1, 1),
          Point.new(1, 2)
        ]
      end
    end
  end
end
