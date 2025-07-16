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

    # Fetches the summary of all awards for a given user
    # See: https://api-docs.retroachievements.org/v1/get-user-awards.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @return [?] ?
    def awards(user)
      get('API_GetUserAwards.php', { u: user })
    end

    # Fetches all set development claims for a given user
    # See: https://api-docs.retroachievements.org/v1/get-user-claims.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @return [?] ?
    def dev_claims(user)
      get('API_GetUserClaims.php', { u: user })
    end

    # A call to this endpoint will retrieve metadata about how a given user
    # has performed/ranked on a given game, targeted by game ID.
    # See: https://api-docs.retroachievements.org/v1/get-user-game-rank-and-score.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @return [?] ?
    def game_rank(user, game_id)
      get('API_GetUserGameRankAndScore.php', { u: user, g: game_id })
    end

    # A call to this endpoint will retrieve a given user's hardcore and softcore points.
    # See: https://api-docs.retroachievements.org/v1/get-user-points.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @return [?] ?
    def points(user)
      get('API_GetUserPoints.php', { u: user })
    end

    # A call to this endpoint will retrieve a given user's progress on a given list of games,
    # targeted by a list of game IDs.
    # See: https://api-docs.retroachievements.org/v1/get-user-progress.html
    #
    # @param user [String] The username or ULID to be used in the search
    # @param game_ids [Array<Integer>] List of game IDs to search for
    # @return [?] ?
    def games_progress(user, game_ids)
      get('API_GetUserProgress.php', { u: user, i: game_ids })
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

    # A call to this endpoint will retrieve summary information about a given user
    # See: https://api-docs.retroachievements.org/v1/get-user-profile.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @param games [Integer] Amount of recent games to return (default is 0)
    # @param achievements [Integer] Amount of recent achievements to return (default is 10)
    # @return [Hash] The user's summary data.
    def summary(user, games: 0, achievements: 10)
      get('API_GetUserSummary.php', { u: user, g: games, a: achievements })
    end

    # * Legacy Endpoint => Use Completion Progress instead *
    # A call to this endpoint will retrieve completion metadata about the games a given user has played
    # See: https://api-docs.retroachievements.org/v1/get-user-completed-games.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @return [?] ?
    def completed_games(user)
      get('API_GetUserCompletedGames.php', { u: user })
    end

    # * Legacy Endpoint => Use Completion Progress instead *
    # A call to this endpoint will retrieve completion metadata about the games a given user has played
    # See: https://api-docs.retroachievements.org/v1/get-user-completed-games.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @param count [Integer] Amount of games to fetch (defaults at 100, max is 500)
    # @param offset [Integer] Amount of games to skip (defaults to 0)
    # @return [?] ?
    def want_to_play(user, count: 100, offset: 0)
      get('API_GetUserWantToPlayList.php', { u: user, c: count, o: offset })
    end

    # A call to this endpoint will retrieve the caller's "Following" users list.
    # See: https://api-docs.retroachievements.org/v1/get-users-i-follow.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @param count [Integer] Amount of records to fetch (defaults at 100, max is 500)
    # @param offset [Integer] Amount of records to skip (defaults to 0)
    # @return [?] ?
    def following(count: 100, offset: 0)
      get('API_GetUsersIFollow.php', { c: count, o: offset })
    end

    # A call to this endpoint will retrieve the caller's "Followers" users list.
    # See: https://api-docs.retroachievements.org/v1/get-users-following-me.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @param count [Integer] Amount of records to fetch (defaults at 100, max is 500)
    # @param offset [Integer] Amount of records to skip (defaults to 0)
    # @return [?] ?
    def followers(count: 100, offset: 0)
      get('API_GetUsersFollowingMe.php', { c: count, o: offset })
    end

    # A call to this endpoint will retrieve the caller's "Followers" users list.
    # See: https://api-docs.retroachievements.org/v1/get-users-following-me.html
    #
    # @param user [String] The username or ULID to fetch profile info for.
    # @param type [Integer] Request list type: 0 = Only active | 1 = all
    # @return [?] ?
    def set_requests(user, type: 0)
      # TODO: Let the user search by string 'all', 'active' => convert to 1 or 0
      get('API_GetUserSetRequests.php', { u: user, t: type })
    end
  end
end
