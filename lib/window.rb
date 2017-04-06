require_relative './graphics/piece_drawer'
require_relative './graphics/square_drawer'
require_relative './entities/piece'
require_relative './shapes/i'
require_relative './core/delta_time_calculator'


module SimpleTetris
  class Window < Gosu::Window
    def initialize(width, height)
      super(width, height)
      self.caption = "Simple Tetris"
      @pieces = []
      @pieces << Entities::Piece.new(Shapes::I.new, Point.new(100, 100))
    end

    def delta_time
      @delta_time ||= DeltaTimeCalculator.new do
        Gosu::milliseconds
      end
    end

    def update
      delta_time.calculate do |delta|
        puts "Delta: #{delta}"
        move_pieces(delta)
      end
    end

    def move_pieces(delta_time)
      @pieces.each do |piece|
        if piece.position.y < 500
          piece.move_down(10)
        end
      end
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
