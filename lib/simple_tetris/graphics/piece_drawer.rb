module SimpleTetris
  module Graphics
    class PieceDrawer
      def initialize(window:)
        @window = window
        @square_drawer = SquareDrawer.new(@window)
      end

      def draw(piece, side_size)
        pos = piece.position
        piece.shape.parts.each do |part|
          x = pos.x + (part.x * side_size)
          y = pos.y + (part.y * side_size)
          @square_drawer.draw(Point.new(x, y), Gosu::Color::GREEN, side_size)
        end
      end
    end
  end
end
