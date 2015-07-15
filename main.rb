$LOAD_PATH.unshift "."

require "curses"
require "ui"
require "game"
require "map"
require "character"
require "pry"

Game.new.run
