module Endpoints
  module Market
    module Sale
      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def sale_count(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/sale/count"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def sale_price_median(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/sale/price/median"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "DateMin": "2015-01-01T00:00:00",
      #       "DateMax": "2020-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def sale_price_median_trend(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/sale/price/median/trend"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def sale_discount_median(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/sale/discount/median"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def sale_listing_count(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/sale/listing/count"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def sale_listing_price_median(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/sale/listing/price/median"
        return post(endpoint: endpoint, body: body)
      end
    end

    module Lease
      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def lease_listing_count(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/lease/listing/count"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "Date": "2022-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def lease_listing_price_median(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/lease/listing/price/median"
        return post(endpoint: endpoint, body: body)
      end

      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "DateMin": "2015-01-01T00:00:00",
      #       "DateMax": "2020-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def lease_listing_price_median_trend(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/lease/listing/price/median/trend"
        return post(endpoint: endpoint, body: body)
      end
    end

    module Yield
      # @param [Hash] body
      # body example = {
      #   {
      #     "Filter": {
      #       "SuburbName": "",
      #       "PostcodeName": "2305",
      #       "StateName": "NSW",
      #       "StatisticalArea3Id": "",
      #       "StatisticalArea4Id": "",
      #       "GreaterCapitalCityStatisticalAreaId": "",
      #       "PropertyTypeId": "hs",
      #       "BedroomCount": 3,
      #       "DateMin": "2015-01-01T00:00:00",
      #       "DateMax": "2020-01-01T00:00:00"
      #     }
      #   }
      # }
      # @return [Hash]
      def yeild_trend(body: body)
        raise ArgumentError, "No body specified" if body.nil?
        raise ArgumentError, "Body must be a hash" if !body.is_a?(Hash)

        endpoint = "/market/yield/trend"
        return post(endpoint: endpoint, body: body)
      end
    end
  end
end