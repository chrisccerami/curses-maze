class UI
  include Curses
  require 'singleton'
  include Singleton

  def initialize
    noecho
    curs_set(0)
    init_screen
  end

  def close
    close_screen
    exit
  end

  def write(x, y, string)
    setpos(y, x)
    addstr(string)
  end

  def accept_input
    inputs = %w(w a s d q)
    loop do
      input = getch
      return input if inputs.include?(input)
    end
  end

  def clear(x, y)
    setpos(y, x)
    delch
    insch(' ')
  end

  def wall?(x, y)
    setpos(y, x)
    inch.chr == '|' || inch.chr == '-'
  end

  def alert_user
    beep
    flash
  end
end
