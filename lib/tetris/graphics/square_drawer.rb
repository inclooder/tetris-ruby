module Tetris
  module Graphics
    class SquareDrawer
      def initialize(window)
        @window = window
      end

      def draw(position, color, size)
        @window.draw_quad(position.x, position.y, color,
                          position.x + size, position.y, color,
                          position.x + size, position.y + size, color,
                          position.x, position.y + size, color)
      end
    end
  end
end
