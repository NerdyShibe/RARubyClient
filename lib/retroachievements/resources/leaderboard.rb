# frozen_string_literal: true

module RA
  #
  # Handles API requests related to games.
  class Leaderboards < Base
    def by_game(game_id, count: 100, offset: 0)
      get('API_GetGameLeaderboards.php', { i: game_id, c: count, o: offset })
    end

    def entries(leaderboard_id, count: 100, offset: 0)
      get('API_GetLeaderboardEntries.php', { i: leaderboard_id, c: count, o: offset })
    end

    def entries_by_game(game_id, username = nil, count: 100, offset: 0)
      get('API_GetUserGameLeaderboards.php', { i: game_id, u: username, c: count, o: offset })
    end
  end
end
