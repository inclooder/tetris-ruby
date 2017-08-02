module Tetris
  module Components
    # x, y relative to Position component
    CollisionBox = Struct.new(:x, :y, :w, :h)
  end
end
