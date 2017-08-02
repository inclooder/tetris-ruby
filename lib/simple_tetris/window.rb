module SimpleTetris
  class Window < Gosu::Window
    def initialize(width, height)
      super(width, height)
      self.caption = 'Tetris'
      @engine = Engine.new
      engine.add_system(Systems::Velocity.new, group: :logic)
      engine.add_system(Systems::Movement.new, group: :logic)
      engine.add_system(Systems::PositionDrawer.new(self), group: :gfx)
      engine.add_system(Systems::CollisionBoxDrawer.new(self), group: :gfx)
      engine.add_system(Systems::PieceDrawer.new(self), group: :gfx)
      new_current_piece
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

    def handle_input(delta)
      if Gosu.button_down?(Gosu::KB_LEFT)
        # @current_piece.position.x -= Config.square_size
      elsif Gosu.button_down?(Gosu::KB_RIGHT)
        # @current_piece.position.x += Config.square_size
      elsif Gosu.button_down?(Gosu::KB_DOWN)
        # @current_piece.position.y += Config.square_size
      end
    end

    def update
      delta_time.calculate do |delta|
        handle_input(delta)
        engine.update(delta, group: :logic)
      end
    end


    def new_current_piece
      engine.entities << pieces_generator.next
    end

    def draw
      @grid_drawer.draw
      engine.update(0, group: :gfx)
    end

    private

    attr_reader :engine
  end
end
