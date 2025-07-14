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
module RetroCheevos
  BASE_URL = 'https://retroachievements.org/API/'

  # Establishes a client connection to the RetroAchievements API.
  #
  # @param user_name [String] Your RetroAchievements username.
  # @param api_key [String] Your RetroAchievements API key.
  # @return [RAClient::Client] A new client instance.
  def self.new(user_name:, api_key:)
    Client.new(user_name: user_name, api_key: api_key)
  end
end
