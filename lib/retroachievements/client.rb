# frozen_string_literal: true

module RA
  # The main client class for making requests to the RetroAchievements API.
  class Client
    BASE_URL = 'https://retroachievements.org/API/'

    attr_reader :username, :api_key

    # Initializes a new Client.
    #
    # @param username [String] Your RetroAchievements username.
    # @param api_key [String] Your RetroAchievements API key.
    def initialize(username:, api_key:)
      @username = username
      @api_key = api_key
    end

    # Provides access to user-related API endpoints.
    #
    # @return [RAClient::User] An instance of the User class.
    def user
      User.new(self)
    end

    # Provides access to game-related API endpoints.
    #
    # @return [RAClient::Game] An instance of the Game class.
    def game
      Game.new(self)
    end

    # Makes a GET request to the specified API endpoint.
    #
    # @param endpoint [String] The API endpoint to call.
    # @param params [Hash] A hash of query parameters.
    # @return [Hash] The parsed JSON response.
    # @raise [ApiError] if the API returns an error.
    def get(endpoint, params = {})
      uri = URI(BASE_URL + endpoint)
      uri.query = URI.encode_www_form(auth_params.merge(params))

      response = Net::HTTP.get_response(uri)

      message = "API request failed: #{response.code} #{response.message}"
      raise ApiError, message unless response.is_a?(Net::HTTPSuccess)

      JSON.parse(response.body)
    end

    private

    # Returns the authentication parameters required for every API request.
    #
    # @return [Hash] A hash containing the username and API key.
    def auth_params
      { y: api_key }
    end
  end
end
