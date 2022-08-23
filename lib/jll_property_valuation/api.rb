require "httparty"
require "json"
require "jll_property_valuation/endpoints/authentication"
require "jll_property_valuation/endpoints/avm"
require "jll_property_valuation/endpoints/index"
require "jll_property_valuation/endpoints/market"
require "jll_property_valuation/endpoints/spatial"

module JllPropertyValuation
  class Api
    include Endpoints::Authentication
    include Endpoints::Avm
    include Endpoints::Index
    include Endpoints::Market
    include Endpoints::Market::Sale
    include Endpoints::Market::Lease
    include Endpoints::Market::Yield
    include Endpoints::Spatial

    attr_accessor :username, :password, :api_key

    def initialize(username: username, password: password, api_key: api_key)
      @username = username
      @password = password
      @base_url = "https://api.openavm.com"
      @token = api_key
    end

    private

    def headers
      @header ||= { "Authorization": "Bearer #{@token}", "Accept": "application/json" }
    end

    def get(endpoint: endpoint)
      raise ArgumentError, "No endpoint specified" if endpoint.nil?
      raise ArgumentError, "Endpoint must be a string" if !endpoint.is_a?(String)

      url = "#{@base_url}/#{endpoint}"
      response = HTTParty.get(url, headers: headers)

      if !response.nil?
        return response
      else
        return { errors: "Could not connect to JLL property valiation" }
      end
    end

    def post(endpoint: endpoint, body: body)
      raise ArgumentError, "No endpoint specified" if endpoint.nil?
      raise ArgumentError, "Endpoint must be a string" if !endpoint.is_a?(String)
      raise ArgumentError, "No body specified" if body.nil?
      raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

      url = "#{@base_url}/#{endpoint}"
      response = HTTParty.post(url, headers: headers, body: body)


      if !response.nil?
        return response
      else
        return { errors: "Could not connect to JLL property valiation" }
      end
    end
  end
end