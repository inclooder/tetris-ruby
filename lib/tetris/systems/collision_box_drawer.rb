module Tetris
  module Systems
    class CollisionBoxDrawer
      def initialize(window)
        @window = window
      end

      def update(delta_time, entities)
        filter_entities(entities).each do |entity|
          draw(entity)
        end
      end

      private

      def draw(entity)
        rect_drawer = Graphics::RectangleDrawer.new(@window)
        position = entity.first(Components::Position)
        boxes = entity.all(Components::CollisionBox)
        boxes.each do |box|
          x = position.x + box.x
          y = position.y + box.y
          rect_drawer.draw(x, y, box.w, box.h, Gosu::Color::RED)
        end
      end

      def filter_entities(entities)
        entities.select do |entity|
          entity.has?(Components::Position) && entity.has?(Components::CollisionBox)
        end
      end
    end
  end
end
