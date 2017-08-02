module Tetris
  module Graphics
    class GridDrawer
      attr_reader :position, :width, :height, 
        :vertical_size,:horizontal_size, :color

      def initialize(window:, position:, width:, height:,
                     vertical_size:, horizontal_size:, color:)
        @window = window
        @position = position
        @width = width
        @height = height
        @vertical_size = vertical_size
        @horizontal_size = horizontal_size
        @color = color
      end

      def draw
        horizontal_lines = (height / vertical_size).to_i
        vertical_lines = (width / horizontal_size).to_i

        (0..horizontal_lines).each do |n|
          y = position.y + (n * vertical_size)
          x = position.x
          @window.draw_line(x, y, color, x + width, y, color)
        end
        
        (0..vertical_lines).each do |n|
          y = position.y
          x = position.x + (n * horizontal_size)
          @window.draw_line(x, y, color, x, y + height, color)
        end
      end
    end
  end
end
