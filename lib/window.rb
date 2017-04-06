require_relative './graphics/piece_drawer'
require_relative './graphics/square_drawer'
require_relative './entities/piece'
require_relative './shapes/i'
require_relative './core/delta_time_calculator'
require_relative './core/pieces_generator'

module SimpleTetris
  class Window < Gosu::Window
    def initialize(width, height)
      super(width, height)
      self.caption = "Simple Tetris"
      @pieces = []
      @pieces << Entities::Piece.new(Shapes::I.new, Point.new(100, 100))
    end

    def delta_time
      @delta_time ||= DeltaTimeCalculator.new { Gosu::milliseconds }
    end

    def pieces_generator
      @pieces_generator ||= PiecesGenerator.new
    end

    def update
      delta_time.calculate do |delta|
        add_piece if @pieces.size == 0
        move_pieces(delta)
      end
    end

    def add_piece
      @pieces << pieces_generator.next
    end

    def move_pieces(delta_time)
      off_screen = []
      @pieces.each do |piece|
        piece.move_down(0.1 * delta_time)
        if piece.position.y > 600
          off_screen << piece
        end
      end
      @pieces -= off_screen
    end

    def draw
      @pieces.each do |piece|
        piece_drawer.draw(piece)
      end
    end

    private 

    def piece_drawer
      @piece_drawer ||= Graphics::PieceDrawer.new(window: self, square_drawer: square_drawer)
    end

    def square_drawer
      @square_drawer ||= Graphics::SquareDrawer.new(self)
    end
  end
end
