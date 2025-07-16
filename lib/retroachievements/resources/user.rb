# frozen_string_literal: true

# lib/ra_client/user.rb

module RA
  # Handles API requests related to users.
  class User < Base
    # Fetches the profile information for a given user.
    # See: https://api-docs.retroachievements.org/v1/get-user-profile.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @return [Hash] The user's profile data.
    def profile(user)
      get('API_GetUserProfile.php', { u: user })
    end

    # Fetches the profile information for a given user.
    # See: https://api-docs.retroachievements.org/v1/get-user-recent-achievements.html
    #
    # @param user [String] The username to fetch profile info for.
    # @return [Hash] The user's profile data.
    def recent_unlocks(user)
      get('API_GetUserRecentAchievements.php', { u: user })
    end

    def unlocks_by_date_range(user, start_time, end_time)
      # TODO: Handle edge cases that the user provides different formats
      epoch_start = DateTime.parse(start_time).to_time.to_i
      epoch_end = DateTime.parse(end_time).to_time.to_i

      get('API_GetAchievementsEarnedBetween.php', { u: user, f: epoch_start, t: epoch_end })
    end

    def unlocks_on_date(user, date)
      # TODO: Handle edge cases that the user provides different formats
      formatted_date = DateTime.parse(date).to_time.strftime('%Y-%m-%d')

      get('API_GetAchievementsEarnedOnDay.php', { u: user, d: formatted_date })
    end

    # Fetches the a given game info and the user completion progress
    # See: https://api-docs.retroachievements.org/v1/get-game-info-and-user-progress.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @param game_id [Integer] Game ID to search for
    # @param awards [Integer] Defines if extra awards metadata should be fetched for the game (Defaults at 0)
    # @return [Hash] Game info and completion progress for the game
    def game_progress(user, game_id, awards: 0)
      get('API_GetGameInfoAndUserProgress.php', { u: user, g: game_id, a: awards })
    end

    # Fetches the overall completion progress for all games
    # See: https://api-docs.retroachievements.org/v1/get-user-completion-progress.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @param count [Integer] Number of records to return (Defaults to 100, Max is 500)
    # @param offset [Integer] Number of records to skip (Defaults to 0)
    # @return [Array<Hash>] A list of recently played games.
    def completion_progress(user, count: 100, offset: 0)
      get('API_GetUserRecentlyPlayedGames.php', { u: user, c: count, o: offset })
    end

    # Fetches the list of games recently played by a user.
    # See: https://api-docs.retroachievements.org/v1/get-user-recently-played-games.html
    #
    # @param user [String] The username to fetch recent games for.
    # @param count [Integer] Number of records to return (Defaults to 10, Max is 50)
    # @param offset [Integer] Number of records to skip (Defaults to 0)
    # @return [Array<Hash>] A list of recently played games.
    def recently_played(user, count: 10, offset: 0)
      get('API_GetUserRecentlyPlayedGames.php', { u: user, c: count, o: offset })
    end
  end
end
