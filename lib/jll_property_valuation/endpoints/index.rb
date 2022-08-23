module Endpoints
  module Index

    # @param [Hash] body
    # body example = {
    #   {
    #     "Filter": {
    #       "AddressName": "2 Lille Street",
    #       "SuburbName": "New Lambton",
    #       "PostcodeName": "2305",
    #       "StateName": "NSW",
    #       "PropertyTypeId": "hs",
    #       "BedroomCount": 3,
    #       "BathroomCount": 2,
    #       "CarCount": 2,
    #       "SiteArea": 800,
    #       "ConstructionYear": 1960,
    #       "ConstructionQuality": 5
    #     }
    #   }
    # }
    # @return [Hash]
    def index_rental_value(body: body)
      raise ArgumentError, "No body specified" if body.nil?
      raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

      endpoint = "/avm/rental/value"
      return post(endpoint: endpoint, body: body)
    end

    # @param [Hash] body
    # body example = {
    #   {
    #     "Filter": {
    #       "AddressName": "2 Lille Street",
    #       "SuburbName": "New Lambton",
    #       "PostcodeName": "2305",
    #       "StateName": "NSW",
    #       "PropertyTypeId": "hs",
    #       "BedroomCount": 3,
    #       "BathroomCount": 2,
    #       "CarCount": 2,
    #       "SiteArea": 800,
    #       "ConstructionYear": 1960,
    #       "ConstructionQuality": 5
    #     }
    #   }
    # }
    # @return [Hash]
    def index_capital_value(body: body)
      raise ArgumentError, "No body specified" if body.nil?
      raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

      endpoint = "/avm/capital/value"
      return post(endpoint: endpoint, body: body)
    end
  end
end