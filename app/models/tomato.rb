class Tomato
  def plant
    @time = 0

    @timer = 1.second.every do
      @time += 1
      puts "Time: #{@time}"
    end
  end

  def kill
    @timer.invalidate if @timer
  end
end