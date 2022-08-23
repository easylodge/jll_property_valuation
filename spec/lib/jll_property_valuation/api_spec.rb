require "spec_helper"

RSpec.describe JllPropertyValuation::Api do
  let(:api_key) { TODO: Your API Key here }
  let(:subject) {
    JllPropertyValuation::Api.new(
      TODO: Username here,
      TODO: Password here,
      api_key
    )
  }

  describe '#auth_ping' do
    it "should return a hash with correct keys" do
      expect(subject.auth_ping().keys).to include("Status", "Message", "Data")
    end
  end

  describe "#auth_login" do
    it "returns the correct keys" do
      expect(subject.auth_login().keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.auth_login()["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.auth_login()["Message"]).to eq(nil)
    end

    it "returns the correct data" do
      expect(subject.auth_login()["Data"].keys).to include(
        "CompanyName",
        "DepartmentName",
        "Mask",
        "TenancyId",
        "Token",
        "UserId",
        "UserName"
      )
    end
  end

  describe "#headers" do
    it "should return the correct formated headers" do
      expect(subject.send(:headers)).to eq({ "Authorization": "Bearer #{api_key}", "Accept": "application/json" })
    end
  end

  describe '#market_sale_count' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_sale_count(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_sale_count(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_sale_count(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_sale_count(body)["Data"].keys).to include(
        "BedroomCount",
        "EndMonth",
        "EndYear",
        "ErrorMessage",
        "GreaterCapitalCityStatisticalAreaId",
        "PostcodeName",
        "PropertyTypeId",
        "SaleCount",
        "StartMonth",
        "StartYear",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "SuburbName",
      )
    end
  end

  describe "#market_sale_price_median" do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_sale_price_median(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_sale_price_median(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_sale_price_median(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_sale_price_median(body)["Data"].keys).to include(
        "BedroomCount",
        "EndMonth",
        "EndYear",
        "ErrorMessage",
        "GreaterCapitalCityStatisticalAreaId",
        "PostcodeName",
        "Price10Percentile",
        "Price90Percentile",
        "PriceMedian",
        "PropertyTypeId",
        "SaleCount",
        "StartMonth",
        "StartYear",
        "StateName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "SuburbName"
      )
    end
  end

  describe '#market_sale_price_median_trend' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "DateMin": "2015-01-01T00:00:00",
        "DateMax": "2020-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_sale_price_median_trend(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_sale_price_median_trend(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_sale_price_median_trend(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_sale_price_median_trend(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StateName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "DateMin",
        "DateMax",
        "SaleIndexItems"
      )
    end
  end

  describe "#market_sale_discount_median" do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_sale_discount_median(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_sale_discount_median(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_sale_discount_median(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_sale_discount_median(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "StartYear",
        "StartMonth",
        "EndYear",
        "EndMonth",
        "SaleCount",
        "DiscountMedian",
        "ErrorMessage"
      )
    end
  end

  describe '#market_sale_listing_count' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_sale_listing_count(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_sale_listing_count(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_sale_listing_count(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_sale_listing_count(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "StartYear",
        "StartMonth",
        "EndYear",
        "EndMonth",
        "ListingCount",
        "ErrorMessage"
      )
    end
  end

  describe '#market_sale_listing_price_median' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_sale_listing_price_median(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_sale_listing_price_median(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_sale_listing_price_median(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_sale_listing_price_median(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "StartYear",
        "StartMonth",
        "EndYear",
        "EndMonth",
        "Listing10Percentile",
        "ListingMedian",
        "Listing90Percentile",
        "ListingCount",
        "ErrorMessage"
      )
    end
  end

  describe '#market_lease_listing_count' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_lease_listing_count(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_lease_listing_count(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_lease_listing_count(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_lease_listing_count(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "StartYear",
        "StartMonth",
        "EndYear",
        "EndMonth",
        "ListingCount",
        "ErrorMessage"
      )
    end
  end

  describe '#market_lease_listing_price_median' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "Date": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_lease_listing_price_median(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_lease_listing_price_median(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_lease_listing_price_median(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_lease_listing_price_median(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "StartYear",
        "StartMonth",
        "EndYear",
        "EndMonth",
        "ListingCount",
        "ListingMedian",
        "ErrorMessage"
      )
    end
  end

  describe '#market_lease_listing_price_median_trend' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "DateMin": "2015-01-01T00:00:00",
        "DateMax": "2020-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_lease_listing_price_median_trend(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_lease_listing_price_median_trend(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_lease_listing_price_median_trend(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_lease_listing_price_median_trend(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StateName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "DateMin",
        "DateMax",
        "LeaseListingIndexItems"
      )
    end
  end

  describe '#market_yield_trend' do
    let(:body) {
      {
        "SuburbName": "",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "StatisticalArea3Id": "",
        "StatisticalArea4Id": "",
        "GreaterCapitalCityStatisticalAreaId": "",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "DateMin": "2015-01-01T00:00:00",
        "DateMax": "2020-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.market_yield_trend(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.market_yield_trend(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.market_yield_trend(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.market_yield_trend(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StateName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "DateMin",
        "DateMax",
        "YieldItems"
      )
    end
  end

  describe "avm_rental_value" do
    let(:body) {
      {
        "AddressName": "2 Lille Street",
        "SuburbName": "New Lambton",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "BathroomCount": 2,
        "CarCount": 2,
        "SiteArea": 800,
        "ConstructionYear": 1960,
        "ConstructionQuality": 5
      }
    }

    it "returns the correct keys" do
      expect(subject.avm_rental_value(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.avm_rental_value(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.avm_rental_value(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.avm_rental_value(body)["Data"].keys).to include(
        "AddressName",
        "AnnualValue",
        "BathroomCount",
        "BedroomCount",
        "CarCount",
        "ComparableFilterTypeId",
        "ComparableLeases",
        "ConfidenceScore",
        "ConstructionQuality",
        "DateAvmBasis",
        "DurationSecondCount",
        "ErrorMessage",
        "GnafAddressId",
        "GnafStreetId",
        "Latitude",
        "Longitude",
        "PostcodeName",
        "PropertyTypeId",
        "SiteArea",
        "StateName",
        "StreetTypeId",
        "SuburbName",
        "WeeklyValue"
      )
    end
  end

  describe 'avm_capital_value' do
    let(:body) {
      {
        "AddressName": "2 Lille Street",
        "SuburbName": "New Lambton",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "BathroomCount": 2,
        "CarCount": 2,
        "SiteArea": 800,
        "ConstructionYear": 1960,
        "ConstructionQuality": 5
      }
    }

    it "returns the correct keys" do
      expect(subject.avm_capital_value(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.avm_capital_value(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.avm_capital_value(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.avm_capital_value(body)["Data"].keys).to include(
        "AddressName",
        "SuburbName",
        "PostcodeName",
        "StateName",
        "PropertyTypeId",
        "BedroomCount",
        "BathroomCount",
        "CarCount",
        "SiteArea",
        "Latitude",
        "Longitude",
        "GnafAddressId",
        "GnafStreetId",
        "StreetTypeId",
        "ConstructionQuality",
        "DateAvmBasis",
        "ImprovedValue",
        "ConfidenceScore",
        "DurationSecondCount",
        "ErrorMessage",
        "ComparableFilterTypeId",
        "ComparableSales"
      )
    end
  end

  describe '#spatial_suburb_find' do
    let(:body) {
      {
        "SuburbName": "New Lambton",
        "PostcodeName": "2305",
        "StateName": "NSW"
      }
    }

    it "returns the correct keys" do
      expect(subject.spatial_suburb_find(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.spatial_suburb_find(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.spatial_suburb_find(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.spatial_suburb_find(body)["Data"].keys).to include(
        "SuburbName",
        "PostcodeName",
        "StateName",
        "LocalGovernmentAreaId",
        "LocalGovernmentAreaName",
        "StatisticalArea3Id",
        "StatisticalArea3Name",
        "StatisticalArea4Id",
        "StatisticalArea4Name"
      )
    end
  end

  describe '#spatial_address_find' do
    let(:body) {
      {
        "AddressName": "2 Lille Street",
        "SuburbName": "New Lambton",
        "PostcodeName": "2305",
        "StateName": "NSW"
      }
    }

    it "returns the correct keys" do
      expect(subject.spatial_address_find(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.spatial_address_find(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.spatial_address_find(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.spatial_address_find(body)["Data"].keys).to include(
        "AddressSlug",
        "AddressName",
        "SuburbName",
        "PostcodeName",
        "StateName",
        "Latitude",
        "Longitude",
        "GnafAddressId",
        "MeshblockId",
        "MeshblockCategory",
        "LocalGovernmentAreaName",
        "StatisticalArea1Id",
        "StatisticalArea2Id",
        "StatisticalArea3Id",
        "StatisticalArea3Name",
        "StatisticalArea4Id",
        "StatisticalArea4Name",
        "BuildingId",
        "CadastreId",
        "TenureTypeId",
        "TenureTypeName"
      )
    end
  end

  describe '#index_rental_value' do
    let(:body) {
      {
        "AddressName": "2 Lille Street",
        "SuburbName": "New Lambton",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "PriorValue": 1000000,
        "DatePriorValue": "2020-01-01T00:00:00",
        "DateIndexValue": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.index_rental_value(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.index_rental_value(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.index_rental_value(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.index_rental_value(body)["Data"].keys).to include(
        "AddressName",
        "SuburbName",
        "PostcodeName",
        "StateName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "DatePriorRentalValue",
        "PriorRentalValue",
        "IndexLocaleName",
        "IndexLocaleValue",
        "IndexPropertyTypeId",
        "IndexBedroomCount",
        "RentalValueDelta",
        "DateValue",
        "AnnualValue",
        "WeeklyValue",
        "ConfidenceScore",
        "ErrorMessage"
      )
    end
  end

  describe '#index_capital_value' do
    let(:body) {
      {
        "AddressName": "2 Lille Street",
        "SuburbName": "New Lambton",
        "PostcodeName": "2305",
        "StateName": "NSW",
        "PropertyTypeId": "hs",
        "BedroomCount": 3,
        "PriorValue": 500,
        "DatePriorValue": "2020-01-01T00:00:00",
        "DateIndexValue": "2022-01-01T00:00:00"
      }
    }

    it "returns the correct keys" do
      expect(subject.index_capital_value(body).keys).to include("Status", "Message", "Data")
    end

    it "returns the correct status" do
      expect(subject.index_capital_value(body)["Status"]).to eq("ok")
    end

    it "returns the correct message" do
      expect(subject.index_capital_value(body)["Message"]).to eq(nil)
    end

    it "returns the correct data keys" do
      expect(subject.index_capital_value(body)["Data"].keys).to include(
        "AddressName",
        "SuburbName",
        "PostcodeName",
        "StateName",
        "StatisticalArea3Id",
        "StatisticalArea4Id",
        "GreaterCapitalCityStatisticalAreaId",
        "PropertyTypeId",
        "BedroomCount",
        "DatePriorCapitalValue",
        "PriorCapitalValue",
        "IndexLocaleName",
        "IndexLocaleValue",
        "IndexPropertyTypeId",
        "IndexBedroomCount",
        "CapitalValueDelta",
        "DateValue",
        "CapitalValue",
        "ConfidenceScore",
        "ErrorMessage"
      )
    end
  end
end