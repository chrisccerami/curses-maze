class Game
  def initialize
    @ui = UI.instance
    @map = Map.new('
      _____________________________________
      |_______                            |
      |       |                           |
      |__     |                           |
      |  |    |                           |
      |  |    |________________________   |
      |  |                             |  |
      |  |                             |  |
      |  |_______________________      |  |
      |                          |     |  |
      |                          |     |  |
      |__________________________|_____|__|
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
    case ui.accept_movement
    when 'w'
      character.move_up
    when 'a'
      character.move_left
    when 's'
      character.move_down
    when 'd'
      character.move_right
    end
    ui.write(character.x_pos, character.y_pos, character.avatar)
  end
end
