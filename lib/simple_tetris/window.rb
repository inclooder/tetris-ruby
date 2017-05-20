module SimpleTetris
  class Window < Gosu::Window
    def initialize(width, height)
      super(width, height)
      self.caption = "Simple Tetris"
      @pieces = []
      @grid_drawer = Graphics::GridDrawer.new(
        window: self,
        position: Point.new(0, 0),
        width: width,
        height: height,
        vertical_size: Config.square_size,
        horizontal_size: Config.square_size,
        color: Gosu::Color::GRAY
      )
    end

    def delta_time
      @delta_time ||= DeltaTimeCalculator.new { Gosu::milliseconds }
    end


    def pieces_generator
      @pieces_generator ||= PiecesGenerator.new
    end

    def handle_input
      if Gosu.button_down?(Gosu::KB_LEFT)
        @current_piece.position.x -= Config.square_size
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        @current_piece.position.x += Config.square_size
      elsif Gosu.button_down?(Gosu::KB_DOWN)
        @current_piece.position.y += Config.square_size
      end
    end

    def update
      handle_input
      delta_time.calculate do |delta|
        move_current_piece(delta)
      end
    end

    def move_current_piece(delta_time)
      new_current_piece unless @current_piece

      if @current_piece.position.y > 600
        new_current_piece
      else
        @current_piece.move_down(0.1 * delta_time)
      end
    end

    def new_current_piece
      @current_piece = pieces_generator.next
      @pieces << @current_piece
    end

    def draw
      @grid_drawer.draw
      @pieces.each do |piece|
        piece_drawer.draw(piece, Config.square_size)
      end
    end

    private 

    def piece_drawer
      @piece_drawer ||= Graphics::PieceDrawer.new(window: self)
    end
  end
end
