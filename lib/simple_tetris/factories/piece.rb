module SimpleTetris
  module Factories
    class Piece
      def self.build(x, y, shape)
        Entity.new(
          Components::Position.new(x, y),
          Components::Velocity.new(0, 0.1),
          shape,
          Components::Movement.new(:left, 200)
        )
      end
    end
  end
end
