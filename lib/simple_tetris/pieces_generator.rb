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
