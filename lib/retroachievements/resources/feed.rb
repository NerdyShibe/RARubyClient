# frozen_string_literal: true

module RA
  #
  # Handles API requests related to feed
  class Feed < Base
    # @param types [Array<String>] A comma-separated list of desired game award kinds.
    #                              Possible values are "beaten-softcore", "beaten-hardcore", "completed",
    #                              and "mastered" (default: all game award kinds).
    def recent_awards(start_date, types, count: 100, offset: 0)
      award_types = %w[beaten-softcore beaten-hardcore completed mastered]
      raise ApiError unless award_types.include?(types)

      get('API_GetRecentGameAwards.php', { d: start_date, k: types, c: count, o: offset })
    end

    # A call to this endpoint returns information about all active set claims (Max: 1000)
    #
    def active_claims
      get('API_GetActiveClaims.php')
    end

    # A call to this endpoint returns information about all (1000 max) achievement
    # set development claims of a specified kind: completed, dropped, or expired.
    #
    def inactive_claims(kind = 'completed')
      valid_kinds = %w[completed dropped expired]
      raise ApiError unless valid_kinds.include?(kind)

      get('API_GetClaims.php', { k: valid_kinds.index[kind] + 1 })
    end

    # A call to this endpoint will retrieve the current top ten users,
    # ranked by hardcore points, on the site.
    #
    def top_10_ranked_users
      get('API_GetTopTenUsers.php')
    end
  end
end
