require_relative '../entities/piece'
require_relative '../shapes/i'
require_relative '../shapes/j'
require_relative '../shapes/l'
require_relative '../shapes/o'
require_relative '../shapes/s'
require_relative '../shapes/t'
require_relative '../shapes/z'

module SimpleTetris
  class PiecesGenerator
    SHAPE_CLASES = [
      Shapes::I,
      Shapes::J,
      Shapes::L,
      Shapes::O,
      Shapes::S,
      Shapes::T,
      Shapes::Z
    ].freeze

    private_constant :SHAPE_CLASES

    def next
      Entities::Piece.new(random_shape.new, Point.new(400, 0))
    end

    private

    def random_shape
      SHAPE_CLASES.sample
    end
  end
end
