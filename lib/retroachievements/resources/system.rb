# frozen_string_literal: true

module RA
  #
  # Handles API requests related to games.
  class System < Base
    def all(active: 0, gaming: 0)
      get('API_GetConsoleIDs.php', { a: active, g: gaming })
    end

    def all_games(achievements: 0, hashes: 0, offset: 0, count: 0)
      get('API_GetGameList.php', { f: achievements, h: hashes, o: offset, c: count })
    end
  end
end
