class Game
  def initialize
    @ui = UI.instance
    @map = Map.new('
      -------------------------------------
      |-------                            |
      |       |                           |
      |--     |                           |
      |  |    |                           |
      |  |    |------------------------   |
      |  |                             |  |
      |  |                             |  |
      |  |-----------------------      |  |
      |                          |     |  |
      |                          |     |  |
      |                          |     |  |
      -------------------------------------
    ')
    @character = Character.new(7, 3)
    at_exit { ui.close }
  end

  def run
    ui.write(0, 0, map.layout)
    ui.write(character.x_pos, character.y_pos, character.avatar)
    loop do
      move_character
    end
  end

  private

  attr_reader :ui, :map, :character

  def move_character
    moves = {
      w: proc { character.move_up },
      a: proc { character.move_left },
      s: proc { character.move_down },
      d: proc { character.move_right }
    }
    moves[ui.accept_movement.to_sym].call
    ui.write(character.x_pos, character.y_pos, character.avatar)
  end
end
