class Tomato
  DEFAULT_TOMAOT_LENGHT = 25 * 60

  attr_accessor :time
  attr_accessor :state

  def initialize(tomato_length = DEFAULT_TOMAOT_LENGHT)
    @tomato_length = tomato_length
    @time = 0
  end

  def plant
    self.time = 0
    self.state = :growing

    @timer = 1.second.every do
      self.time += 1
      @timer.invalidate if self.time == @tomato_length
    end
  end

  def harvest
    @timer.invalidate if @timer

    self.state = :finish
  end

  def kill
    @timer.invalidate if @timer
    self.state = :killed
  end
end