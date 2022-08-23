module Endpoints
  module Spatial

    # @pamam [Hash] body
    # body example = {
    #   {
    #     "Filter": {
    #       "SuburbName": "New Lambton",
    #       "PostcodeName": "2305",
    #       "StateName": "NSW"
    #     }
    #   }
    # }
    # @return [Hash]
    def suburb_find(body: body)
      raise ArgumentError, "No body specified" if body.nil?
      raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

      endpoint = "/spatial/suburb/find"
      return post(endpoint: endpoint, body: body)
    end

    # @param [Hash] body
    # body example = {
    #   {
    #     "Filter": {
    #       "AddressName": "2 Lille Street",
    #       "SuburbName": "New Lambton",
    #       "PostcodeName": "2305",
    #       "StateName": "NSW"
    #     }
    #   }
    # }
    # @return [Hash]
    def address_find(body: body)
      raise ArgumentError, "No body specified" if body.nil?
      raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

      endpoint = "/spatial/address/find"
      return post(endpoint: endpoint, body: body)
    end
  end
end