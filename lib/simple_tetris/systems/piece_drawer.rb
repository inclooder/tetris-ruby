module SimpleTetris
  module Systems
    class PieceDrawer
      def initialize(window)
        @window = window
        @square_drawer = Graphics::SquareDrawer.new(@window)
      end

      def update(delta_time, entities)
        filter_entities(entities).each do |entity|
          draw(entity)
        end
      end

      private

      def draw(entity)
        pos = entity.first(Components::Position)
        shape = entity.first(Shapes::Base)

        shape.parts.each do |part|
          x = pos.x + part.x
          y = pos.y + part.y

          @square_drawer.draw(Point.new(x, y), 
                              Gosu::Color::GREEN, part.size)
        end
      end

      def filter_entities(entities)
        entities.select do |entity|
          entity.has?(Components::Position) && entity.has?(Shapes::Base)
        end
      end
    end
  end
end
