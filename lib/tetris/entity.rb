module Tetris
  class Entity
    attr_reader :components

    def initialize(*components)
      @components = components
    end

    def has?(klass)
      components.any? do |component|
        component.is_a?(klass)
      end
    end

    def all(klass)
      components.select do |component|
        component.is_a?(klass)
      end
    end

    def first(klass)
      components.find do |component|
        component.is_a?(klass)
      end
    end
  end
end
