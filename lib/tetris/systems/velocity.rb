module Tetris
  module Systems
    class Velocity
      def update(delta_time, entities)
        filter_entities(entities).each do |entity|
          velocity = entity.first(Components::Velocity)
          position = entity.first(Components::Position)
          position.x += velocity.vx * delta_time
          position.y += velocity.vy * delta_time
        end
      end

      private

      def filter_entities(entities)
        entities.select do |entity|
          entity.has?(Components::Velocity) && entity.has?(Components::Position) && entity.has?(Shapes::Base)
        end
      end
    end
  end
end
