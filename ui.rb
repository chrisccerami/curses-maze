class UI
  include Curses

  def initialize
    noecho
    curs_set(0)
    init_screen
  end

  def close
    close_screen
  end

  def write(x, y, string)
    setpos(y, x)
    addstr(string)
  end

  def accept_movement
    dirs = ["w", "a", "s", "d"]
    loop do
      dir = getch
      return dir if dirs.include?(dir)
    end
  end

  def clear(x, y)
    setpos(y, x)
    delch
    insch(" ")
  end
end
