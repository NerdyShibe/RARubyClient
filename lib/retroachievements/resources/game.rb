# frozen_string_literal: true

module RA
  #
  # Handles API requests related to games.
  class Game < Base
    # A call to this endpoint will retrieve basic metadata about a game, targeted via its unique ID.
    # See: https://api-docs.retroachievements.org/v1/get-game.html
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @return [Hash] A summary of the especific game data.
    def summary(game_id)
      get('API_GetGame.php', { i: game_id })
    end

    # A call to this endpoint will retrieve extended metadata about a game, targeted via its unique ID.
    # See: https://api-docs.retroachievements.org/v1/get-game-extended.html
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @param achievements [Integer] Additional info about achievements, set to 5 to see unofficial/demoted ones
    # @return [Hash] ?
    def extended_details(game_id, achievements: 3)
      get('API_GetGameExtended.php', { i: game_id, f: achievements })
    end

    # A call to this endpoint will retrieve the hashes linked to a game, targeted via its unique ID.
    # See: https://api-docs.retroachievements.org/v1/get-game-hashes.html
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @return [Hash] ?
    def hashes(game_id)
      get('API_GetGameHashes.php', { i: game_id })
    end

    # A call to this endpoint will retrieve the list of achievement IDs for a game, targeted by game ID
    # See: https://api-docs.retroachievements.org/v1/get-achievement-count.html
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @return [Hash] ?
    def achievement_ids(game_id)
      get('API_GetAchievementCount.php', { i: game_id })
    end

    # A call to this endpoint will retrieve the list of achievement IDs for a game, targeted by game ID
    # See: https://api-docs.retroachievements.org/v1/get-achievement-distribution.html
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @param mode [Integer] 1 => Only hardcore unlocks | 0 => All unlocks
    # @param type [Integer] Achievement type 3 => Official, 5 => Unofficial
    # @return [Hash] ?
    def unlocks(game_id, mode: 0, type: 3)
      get('API_GetAchievementDistribution.php', { i: game_id, h: mode, f: type })
    end

    # A call to this endpoint will retrieve metadata about either
    # the latest masters for a game, or the highest points earners for a game.
    # The game is targeted via its unique ID.
    # See: https://api-docs.retroachievements.org/v1/get-game-rank-and-score.html
    #
    # @param game_id [Integer] The unique identifier for the game.
    # @param type [Integer] 1 = Latest masteries | 0 = Non-masteries high scores (default)
    # @return [Hash] ?
    def high_scores(game_id, type: 0)
      get('API_GetGameRankAndScore.php', { g: game_id, t: type })
    end
  end
end
