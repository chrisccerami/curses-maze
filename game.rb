class Game
  def initialize
    @ui = UI.new
    at_exit { ui.close }
  end

  def run
  end

  private

  attr_reader :ui
end
