# frozen_string_literal: true

require 'forwardable'

module RetroCheevos
  # Base resource
  class Base
    extend Forwardable

    def initialize(client)
      @client = client
    end

    def_delegators :@client, :get
  end
end
