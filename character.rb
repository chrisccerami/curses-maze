class Character
  attr_accessor :avatar, :x_pos, :y_pos
  def initialize(x, y)
    @avatar = "@"
    @x_pos = x
    @y_pos = y
  end

  def move_up
    @y_pos -= 1
  end

  def move_down
    @y_pos += 1
  end

  def move_left
    @x_pos -= 1
  end

  def move_right
    @x_pos += 1
  end

  def can_move?(target)

  end
end
