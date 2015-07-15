class Character
  attr_accessor :avatar, :x_pos, :y_pos
  def initialize(avatar, x, y)
    @avatar = avatar
    @x_pos = x
    @y_pos = y
  end

  def move(x, y)
    if can_move?(x, y)
      UI.instance.clear(@x_pos, @y_pos)
      @x_pos = x
      @y_pos = y
    else
      UI.instance.alert_user
    end
  end

  def move_up
    move(@x_pos, @y_pos - 1)
  end

  def move_down
    move(@x_pos, @y_pos + 1)
  end

  def move_left
    move(@x_pos - 1, @y_pos)
  end

  def move_right
    move(@x_pos + 1, @y_pos)
  end

  def can_move?(target_x, target_y)
    !UI.instance.wall?(target_x, target_y)
  end
end
