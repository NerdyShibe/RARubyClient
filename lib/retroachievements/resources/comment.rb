# frozen_string_literal: true

module RA
  #
  # Handles API requests related to games.
  class Comment < Base
    # @param target [Integer | String] Game ID, Achievement ID or username/ULID
    # @param type [Integer] 1 => game, 2 => achievement, 3 => user
    def by_type(target, type, count: 100, offset: 0, sort: 'submitted')
      get(
        'API_GetComments.php',
        { i: target, t: type, c: count, o: offset, sort: sort }
      )
    end
  end
end
