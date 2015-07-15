class Game
  def initialize
    @ui = UI.instance
    @map = Map.new(YAML.load_file('./map.yaml'))
    @character = Character.new(1, 2)
    at_exit { ui.close }
  end

  def run
    ui.write(0, 0, map.layout)
    ui.write(character.x_pos, character.y_pos, character.avatar)
    loop do
      accept_input
    end
  end

  private

  attr_reader :ui, :map, :character

  def accept_input
    inputs = {
      w: proc { character.move_up },
      a: proc { character.move_left },
      s: proc { character.move_down },
      d: proc { character.move_right },
      q: proc { ui.close }
    }
    inputs[ui.accept_input.to_sym].call
    ui.write(character.x_pos, character.y_pos, character.avatar)
  end
end
