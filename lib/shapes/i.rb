require_relative '../core/point'

module SimpleTetris
  module Shapes
    class I
      def parts
        @parts ||= make_parts
      end

      def origin
        @origin ||= Point.new(0, 0)
      end

      private

      def make_parts
        [
          Point.new(0, 0),
          Point.new(0, 1),
          Point.new(0, 2),
          Point.new(0, 3)
        ]
      end
    end
  end
end
