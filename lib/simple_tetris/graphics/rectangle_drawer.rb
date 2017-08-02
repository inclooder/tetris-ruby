module SimpleTetris
  module Graphics
    class RectangleDrawer
      def initialize(window)
        @window = window
      end

      def draw(x, y, width, height, color)
        @window.draw_quad(x, y, color,
                          x + width, y, color,
                          x + width, y + height, color,
                          x, y + height, color)
      end
    end
  end
end
