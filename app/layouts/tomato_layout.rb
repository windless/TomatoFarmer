class TomatoLayout < MotionKit::Layout
  include BW::KVO

  view :timer
  view :plant_btn
  view :kill_btn
  view :seed_view
  view :earth_view

  def layout
    root :main do
      add UIButton, :plant_btn
      add UIButton, :kill_btn
      add UILabel, :timer
      add UIImageView, :earth_view
      add UIImageView, :seed_view
    end
  end

  def bind(tomato)
    unobserve_all

    self.time_string = tomato.time
    self.tomato_state = tomato.state
    observe(tomato, :time) do |old_time, new_time|
      self.time_string = new_time
    end

    observe(tomato, :state) do |old_state, new_state|
      self.tomato_state = tomato.state
    end
  end

  def start_planting(tomato)
    seed_view.slide :down, 30, duration: 1 do
      seed_view.fade_out do
        tomato.plant
      end
    end
  end

  # styles

  def earth_view_style
    background_color :gray.uicolor
    frame from_bottom(size: [200, 100], up: 200)
  end

  def seed_view_style
    background_color :green.uicolor
    size [50, 50]
    frame above(:earth_view, down: 20)
    center_x '50%'

    layer do
      corner_radius 25
    end
  end

  def main_style
    background_color :white.uicolor
  end

  def plant_btn_style
    title "种植"
    title_color :white.uicolor
    background_color :gray.uicolor
    frame from_bottom(size:[200, 40], up: 20)
  end

  def kill_btn_style
    title "杀掉"
    title_color :white.uicolor
    background_color :gray.uicolor
    frame from_bottom(size:[200, 40], up: 20)
    hidden true
  end

  def timer_style
    text_color UIColor.blackColor
    text "00:00"
    font :system.uifont(40)
    size_to_fit
    center ['50%', 100]
  end

  private

  def time_string=(time_int)
    minutes = time_int / 60
    seconds = time_int % 60
    timer.text = "%02d:%02d" % [minutes, seconds]
  end

  def tomato_state=(state)
    case state
    when :growing
      plant_btn.hidden = true
      kill_btn.hidden = false
      timer.show
    when :killed
      plant_btn.hidden = false
      kill_btn.hidden = true
    end
  end
end