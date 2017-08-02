module SimpleTetris
  class Part
    attr_reader :size

    def initialize(x, y, size: Config.square_size)
      @x = x
      @y = y
      @size = size
    end

    def x
      @x * size
    end

    def y
      @y * size
    end
  end
end
