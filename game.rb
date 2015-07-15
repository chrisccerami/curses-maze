class Game
  def initialize
    @ui = UI.new
    @map = Map.new
    @character = Character.new(7, 3)
    at_exit { ui.close }
  end

  def run
    ui.write(0, 0, map.layout)
    ui.write(character.x_pos, character.y_pos, character.avatar)
    while true
      move_character
    end
  end


  private

  attr_reader :ui, :map, :character

  def move_character
    case ui.accept_movement
    when "w"
      ui.clear(character.x_pos, character.y_pos)
      character.move_up
    when "a"
      ui.clear(character.x_pos, character.y_pos)
      character.move_left
    when "s"
      ui.clear(character.x_pos, character.y_pos)
      character.move_down
    when "d"
      ui.clear(character.x_pos, character.y_pos)
      character.move_right
    end
    ui.write(character.x_pos, character.y_pos, character.avatar)
  end

end
