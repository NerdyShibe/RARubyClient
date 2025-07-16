# frozen_string_literal: true

module RA
  #
  # Handles API requests related to games.
  class Achievement < Base
    def all_unlocks(achievement_id, count: 50, offset: 0)
      get('API_GetAchievementUnlocks.php', { a: achievement_id, c: count, o: offset })
    end
  end
end
