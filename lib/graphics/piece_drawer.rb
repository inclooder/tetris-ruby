module SimpleTetris
  module Graphics
    class PieceDrawer
      def initialize(window:, square_drawer:)
        @window = window
        @square_drawer = square_drawer
      end

      def draw(piece)
        pos = piece.position
        piece.shape.parts.each do |part|
          x = pos.x + (part.x * 10)
          y = pos.y + (part.y * 10)
          @square_drawer.draw(Point.new(x, y), Gosu::Color::GREEN, 10)
        end
      end
    end
  end
end
