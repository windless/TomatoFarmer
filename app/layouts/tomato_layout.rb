class TomatoLayout < MotionKit::Layout

  def layout
    add UIButton, :button
    add UIButton, :kill
  end

  def button_style
    title "Plant"
    title_color UIColor.blackColor
    size_to_fit

    center ['50%', '50%']
  end

  def kill_style
    title "Kill"
    title_color UIColor.blackColor
    size_to_fit

    center ['50%', '70%']
  end

end