module Tetris
  class Engine
    attr_reader :entities

    def initialize
      @entities = []
      @systems = Hash.new { |hash, key| hash[key] = [] }
    end

    def update(delta_time, group: :default)
      @systems[group].each do |system|
        system.update(delta_time, entities)
      end
    end

    def add_system(system, group: :default)
      @systems[group] << system
    end
  end
end
