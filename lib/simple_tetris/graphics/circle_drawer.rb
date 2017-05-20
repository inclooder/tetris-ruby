module SimpleTetris
  module Graphics
    class CircleDrawer
      attr_reader :position, :color, :radius

      def initialize(window:, position:, color:, radius:)
        @window = window
        @position = position
        @color = color
        @radius = radius
      end

      def draw
        angle = 0.0
        previous_point = nil
        while angle < 2 * Math::PI + 0.1
          x = position.x + (radius * Math.cos(angle))
          y = position.y + (radius * Math.sin(angle))
          if previous_point
            @window.draw_line(x, y, color, previous_point.x, previous_point.y, color)
          end
          previous_point = Point.new(x, y)
          angle += 0.1
        end
      end
    end
  end
end
