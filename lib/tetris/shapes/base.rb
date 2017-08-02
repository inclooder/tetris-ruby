module Tetris
  module Shapes
    class Base
      def parts
        @parts ||= make_parts
      end

      def geometry
        raise 'not implemented'
      end

      def make_parts
        parts = [] 
        geometry.each_with_index do |rows, x|
          rows.each_with_index do |columns, y|
            next if geometry[x][y] != 1
            parts << Part.new(x, y)
          end
        end
        parts
      end
    end
  end
end
