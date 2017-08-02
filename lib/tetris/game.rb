module Tetris
  class Game
    def initialize
      @window = Window.new(Config.window_width, Config.window_height)
    end

    def run
      @window.show
    end
  end
end
