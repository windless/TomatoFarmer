class TomatoScreen < PM::Screen
  def on_load
    @layout = TomatoLayout.new(root: self.view).build

    @layout.plant_btn.on(:touch) do
      tomato = Tomato.new
      @layout.bind(tomato)
      @layout.start_planting(tomato)

      @layout.kill_btn.on(:touch) do
        tomato.kill
      end
    end

  end
end