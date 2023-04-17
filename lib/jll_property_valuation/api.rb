require "httparty"
require "jll_property_valuation/endpoints/authentication"

module JllPropertyValuation
  class Api
    include Endpoints::Authentication

    attr_accessor :username, :password, :token

    def initialize(username, password, token)
      @username = username
      @password = password
      @token = token
      @base_url = "https://valoremau-api.jll.com"
    end

    AVM_ROUTES = [
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

    Api::AVM_ROUTES.each do |route|
      define_method(route.tr('/', '_').to_sym) do |body|
        return post(route, { "Filter": body })
      end
    end

    RISK_ROUTES = [
      "insight/environment/bushfire/risk/find",
      "insight/environment/flood/risk/find",
      "insight/environment/communicationtower/risk/find",
      "insight/environment/electricitytransmission/risk/find",
      "insight/environment/zone/risk/find",
      "insight/environment/airnoise/risk/find",
      "insight/environment/railnoise/risk/find",
      "insight/environment/roadnoise/risk/find",
      "insight/economy/rank/risk/find",
      "insight/economy/employmentdiversity/risk/find",
      "insight/economy/employmentrate/risk/find",
      "insight/economy/lendersmortgageinsurance/risk/find",
      "insight/market/inventory/risk/find",
      'insight/market/forecast/risk/find',
      "insight/market/liquidity/risk/find",
      "insight/market/volatility/risk/find",
      "insight/market/rentaltenure/risk/find"
    ].freeze

    Api::RISK_ROUTES.each do |route|
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