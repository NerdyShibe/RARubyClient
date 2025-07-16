# frozen_string_literal: true

# lib/ra_client/game.rb

module RA
  #
  # Handles API requests related to games.
  class Game < Base
    # Fetches extended information about a specific game.
    # See: https://api-docs.retroachievements.org/v1/#!/game/get-api-get-game-extended
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @return [Hash] The extended game data.
    def info(game_id)
      get('API_GetGameExtended.php', { i: game_id })
    end

    # Fetches the user progress for a given game.
    # See: https://api-docs.retroachievements.org/v1/#!/game/get-api-get-game-progress
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @param user_name [String] The user to fetch progress for.
    # @return [Hash] The user's progress for the specified game.
    def progress(game_id, user_name)
      get('API_GetGameProgress.php', { i: game_id, u: user_name })
    end
  end
end
