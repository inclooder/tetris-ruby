module Tetris
  class DeltaTimeCalculator
    def initialize(&block)
      @time_func = block
    end

    def calculate(&block)
      @last_time ||= current_time
      delta = current_time - @last_time
      yield(delta)
      @last_time = current_time
    end

    private

    def current_time
      @time_func.call
    end
  end
end
