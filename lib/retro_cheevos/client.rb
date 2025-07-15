# frozen_string_literal: true

module RetroCheevos
  # The main client class for making requests to the RetroAchievements API.
  class Client
    attr_reader :user_name, :api_key

    # Initializes a new Client.
    #
    # @param user_name [String] Your RetroAchievements username.
    # @param api_key [String] Your RetroAchievements API key.
    def initialize(user_name:, api_key:)
      @user_name = user_name
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

      raise ApiError, "API request failed: #{response.code} #{response.message}" unless response.is_a?(Net::HTTPSuccess)

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
