module SimpleTetris
  module Systems
    class Movement
      def update(delta_time, entities)
        filter_entities(entities).each do |entity|
          position = entity.first(Components::Position)
          movement = entity.first(Components::Movement)
          distance = 0.1 * delta_time
          movement.distance -= distance
          if movement.distance <= 0
            distance -= movement.distance.abs
            entity.components.delete(movement)
          end

          if movement.direction == :left
            position.x -= distance
          elsif movement.direction == :right
            position.x += distance
          end
        end
      end

      private

      def filter_entities(entities)
        entities.select do |entity|
          entity.has?(Components::Position) && entity.has?(Components::Movement)
        end
      end
    end
  end
end
