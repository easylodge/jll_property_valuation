require "httparty"
require "jll_property_valuation/endpoints/authentication"

module JllPropertyValuation
  class Api
    include Endpoints::Authentication

    attr_accessor :username, :password, :api_key

    def initialize(username, password, api_key)
      @username = username
      @password = password
      @token = api_key
      @base_url = "https://api.openavm.com"
    end

    ROUTES = [
      "avm/capital/value",
      "avm/rental/value",
      "index/capital/value",
      "index/rental/value",
      "market/lease/listing/count",
      "market/lease/listing/price/median",
      "market/lease/listing/price/median/trend",
      "market/sale/count",
      "market/sale/discount/median",
      "market/sale/listing/count",
      "market/sale/listing/price/median",
      "market/sale/price/median",
      "market/sale/price/median/trend",
      "market/yield/trend",
      "spatial/address/find",
      "spatial/suburb/find"
    ].freeze

    Api::ROUTES.each do |route|
      define_method(route.tr('/', '_').to_sym) do |body|
        return post(route, { "Filter": body })
      end
    end

    private

    def headers
      @header ||= { "Authorization": "Bearer #{@token}", "Accept": "application/json" }
    end

    def get(uri)
      return HTTParty.get("#{@base_url}/#{uri}", headers: headers)
    end

    def post(uri, body)
      return HTTParty.post("#{@base_url}/#{uri}", headers: headers, body: body)
    end
  end
end