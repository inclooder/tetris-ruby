module Tetris
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
      Factories::Piece.build(400, 0, random_shape_class.new)
    end

    private

    def random_shape_class
      SHAPE_CLASES.sample
    end
  end
end
