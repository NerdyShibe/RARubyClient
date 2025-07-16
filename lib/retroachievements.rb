# frozen_string_literal: true

require 'net/http'
require 'json'

require_relative 'retro_cheevos/client'
require_relative 'retro_cheevos/resources/base'
require_relative 'retro_cheevos/resources/game'
require_relative 'retro_cheevos/resources/user'
require_relative 'retro_cheevos/utils/errors'

#
# Main module for the wrapper
module RA
  VERSION = '0.0.1'
end
