$LOAD_PATH.unshift '.'

require 'curses'
require 'ui'
require 'game'
require 'map'
require 'character'
require 'yaml'

Game.new.run
