module Tetris
  class Rect
    attr_reader :x, :y, :w, :h

    def initialize(x, y, w, h)
      @x = x
      @y = y
      @w = w
      @h = h
    end
  end
end
