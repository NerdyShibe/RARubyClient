# frozen_string_literal: true

# lib/ra_client/user.rb

module RetroCheevos
  # Handles API requests related to users.
  class User < Base
    # Fetches the profile information for a given user.
    # See: https://api-docs.retroachievements.org/v1/#!/user/get-api-user-profile
    #
    # @param user_name [String] The username to fetch profile info for.
    # @return [Hash] The user's profile data.
    def profile(user_name)
      get('API_GetUserProfile.php', { u: user_name })
    end

    # Fetches the profile information for a given user.
    # See: https://api-docs.retroachievements.org/v1/#!/user/get-api-user-profile
    #
    # @param user_name [String] The username to fetch profile info for.
    # @return [Hash] The user's profile data.
    def recent_unlocks(user_name)
      get('API_GetUserRecentAchievements.php', { u: user_name })
    end

    # Fetches the list of games recently played by a user.
    # See: https://api-docs.retroachievements.org/v1/#!/user/get-api-user-recently-played
    #
    # @param user_name [String] The username to fetch recent games for.
    # @param offset [Integer] The number of entries to skip.
    # @param count [Integer] The number of entries to return.
    # @return [Array<Hash>] A list of recently played games.
    def recently_played(user_name, offset: 0, count: 10)
      get('API_GetUserRecentlyPlayed.php', { u: user_name, o: offset, c: count })
    end
  end
end
