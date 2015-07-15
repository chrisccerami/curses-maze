$LOAD_PATH.unshift "."

require "curses"
require "ui"
require "game"

Game.new.run
