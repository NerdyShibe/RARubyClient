# frozen_string_literal: true

module RA
  #
  # Handles API requests related to dev tickets
  class Ticket < Base
    # Retrieves ticket metadata information about a single achievement ticket,
    # targeted by its ticket ID.
    #
    def info(ticket_id)
      get('API_GetTicketData.php', { i: ticket_id })
    end

    def most_reports(count: 10, offset: 0)
      get('API_GetTicketData.php', { f: 1, c: count, o: offset })
    end

    def most_recent(count: 10, offset: 0)
      get('API_GetTicketData.php', { c: count, o: offset })
    end

    def game_stats(game_id, type = nil, deep = nil)
      get('API_GetTicketData.php', { g: game_id, f: type, d: deep })
    end

    def developer_stats(username, ulid = nil)
      get('API_GetTicketData.php', { u: username, i: ulid })
    end

    def achievement_stats(achievement_id)
      get('API_GetTicketData.php', { a: achievement_id })
    end
  end
end
