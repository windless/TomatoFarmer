class MainScreen < PM::Screen
  title "Tomato"
  
  def on_load
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

    @button.on(:touch) { plant_a_tomato }
    @kill_button.on(:touch) { kill_a_tomato }
  end

  def loadView
    @layout = TomatoLayout.new
    self.view = @layout.view
    @button = @layout.get(:button)
    @kill_button = @layout.get(:kill)
  end

  def plant_a_tomato
    @tomato = Tomato.new
    @tomato.plant
    @button.hidden = true
    slide
  end

  def kill_a_tomato
    @tomato.kill
    @button.hidden = false
  end

  def slide
    @kill_button.slide(:up, 20)
  end
end