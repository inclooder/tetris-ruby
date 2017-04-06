require_relative 'bootstrap'
require_relative 'window'

module SimpleTetris
  class Game
    def initialize
      @window = Window.new(800, 600)
    end

    def run
      @window.show
    end
  end
end
