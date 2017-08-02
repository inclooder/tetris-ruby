module SimpleTetris
  module Systems
    class PositionDrawer
      def initialize(window)
        @window = window
      end

      def update(delta_time, entities)
        filter_entities(entities).each do |entity|
          draw_position(entity)
        end
      end

      private

      def draw_position(entity)
        position = entity.first(Components::Position)
        circle_drawer = Graphics::CircleDrawer.new(window: @window, position: position, color: Gosu::Color::RED, radius: 2)
        circle_drawer.draw
      end

      def filter_entities(entities)
        entities.select do |entity|
          entity.has?(Components::Position)
        end
      end
    end
  end
end
