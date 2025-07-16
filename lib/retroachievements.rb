# frozen_string_literal: true

require 'net/http'
require 'json'

require_relative 'retroachievements/client'
require_relative 'retroachievements/resources/achievement'
require_relative 'retroachievements/resources/base'
require_relative 'retroachievements/resources/comment'
require_relative 'retroachievements/resources/feed'
require_relative 'retroachievements/resources/game'
require_relative 'retroachievements/resources/leaderboard'
require_relative 'retroachievements/resources/system'
require_relative 'retroachievements/resources/ticket'
require_relative 'retroachievements/resources/user'
require_relative 'retroachievements/utils/errors'

#
# Main module for the wrapper
module RA
  VERSION = '0.1.0'
end
