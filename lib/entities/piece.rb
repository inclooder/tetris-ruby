module SimpleTetris
  module Entities
    class Piece
      attr_reader :position, :shape

      def initialize(shape, position)
        @shape = shape
        @position = position
      end

      def move_down(amount)
        @position.y += amount
      end
    end
  end
end
