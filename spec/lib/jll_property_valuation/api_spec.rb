require "spec_helper"

RSpec.describe JllPropertyValuation::Api do
  let(:api_key) { TODO: <your token here> }
  let(:subject) {
    JllPropertyValuation::Api.new(
      username: TODO: <your username here>,
      password: TODO: <your password here>,
      api_key: api_key
    )
  }

  describe "#headers" do
    it "should return the correct formated headers" do
      expect(subject.send(:headers)).to eq({ "Authorization": "Bearer #{api_key}", "Accept": "application/json" })
    end
  end

  describe "#get" do
    it "should raise error if endpoint nil" do
      expect { subject.send(:get, endpoint: nil) }.to raise_error(ArgumentError)
    end

    it "should raise error if endpoint is not a string" do
      expect { subject.send(:get, endpoint: 1) }.to raise_error(ArgumentError)
    end
  end

  describe "#post" do
    it "should raise error if endpoint nil" do
      expect { subject.send(:post, endpoint: nil, body: {}) }.to raise_error(ArgumentError, "No endpoint specified")
    end

    it "should raise error if endpoint is not a string" do
      expect { subject.send(:post, endpoint: 1, body: {}) }.to raise_error(ArgumentError, "Endpoint must be a string")
    end

    it "should raise error if body nil" do
      expect { subject.send(:post, endpoint: "", body: nil) }.to raise_error(ArgumentError, "No body specified")
    end

    it "should raise error if body is not a hash" do
      expect { subject.send(:post, endpoint: "", body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
    end
  end

  context "endpoints module" do
    let(:body) {
      {
        "Filter": {
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
    }

    context "authentication module" do
      describe '#ping' do
        it "should return a hash with correct keys" do
          expect(subject.ping().keys).to include("Status", "Message", "Data")
        end
      end

      describe "#login" do
        it "returns the correct keys" do
          expect(subject.login().keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.login()["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.login()["Message"]).to eq(nil)
        end

        it "returns the correct data" do
          expect(subject.login()["Data"].keys).to include(
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
    end

    context "avm module" do
      describe "#avm_rental_value" do
        it "raises error if body is nil" do
          expect { subject.avm_rental_value(body: nil) }.to raise_error(ArgumentError, "No body specified")
        end

        it "raises error if body is not a hash" do
          expect { subject.avm_rental_value(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
        end

        it "returns the correct keys" do
          expect(subject.avm_rental_value(body: body).keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.avm_rental_value(body: body)["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.avm_rental_value(body: body)["Message"]).to eq(nil)
        end

        it "returns the correct data keys" do
          expect(subject.avm_rental_value(body: body)["Data"].keys).to include(
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

      describe "#captial_value" do
        it "raises error if body is nil" do
          expect { subject.avm_capital_value(body: nil) }.to raise_error(ArgumentError, "No body specified")
        end

        it "raises error if body is not a hash" do
          expect { subject.avm_capital_value(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
        end

        it "returns the correct keys" do
          expect(subject.avm_capital_value(body: body).keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.avm_capital_value(body: body)["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.avm_capital_value(body: body)["Message"]).to eq(nil)
        end

        it "returns the correct data keys" do
          expect(subject.avm_capital_value(body: body)["Data"].keys).to include(
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
    end

    context "index module" do
      describe "#index_rental_value" do
        it "raises error if body is nil" do
          expect { subject.index_rental_value(body: nil) }.to raise_error(ArgumentError, "No body specified")
        end

        it "raises error if body is not a hash" do
          expect { subject.index_rental_value(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
        end

        it "returns the correct keys" do
          expect(subject.index_rental_value(body: body).keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.index_rental_value(body: body)["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.index_rental_value(body: body)["Message"]).to eq(nil)
        end

        it "returns the correct data keys" do
          expect(subject.index_rental_value(body: body)["Data"].keys).to include(
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

      describe "#index_capital_value" do
        it "raises error if body is nil" do
          expect { subject.index_capital_value(body: nil) }.to raise_error(ArgumentError, "No body specified")
        end

        it "raises error if body is not a hash" do
          expect { subject.index_capital_value(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
        end

        it "returns the correct keys" do
          expect(subject.index_capital_value(body: body).keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.index_capital_value(body: body)["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.index_capital_value(body: body)["Message"]).to eq(nil)
        end

        it "returns the correct data keys" do
          expect(subject.index_capital_value(body: body)["Data"].keys).to include(
            "AddressName",
            "BathroomCount",
            "BedroomCount",
            "CarCount",
            "ComparableFilterTypeId",
            "ComparableSales",
            "ConfidenceScore",
            "ConstructionQuality",
            "DateAvmBasis",
            "DurationSecondCount",
            "ErrorMessage",
            "GnafAddressId",
            "GnafStreetId",
            "ImprovedValue",
            "Latitude",
            "Longitude",
            "PostcodeName",
            "PropertyTypeId",
            "SiteArea",
            "StateName",
            "StreetTypeId",
            "SuburbName"
          )
        end
      end
    end

    context "market module" do
      context "sale module" do
        let(:body) {
          {
            "Filter": {
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
        }

        describe "#sale_count" do
          it "raises error if body is nil" do
            expect { subject.sale_count(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.sale_count(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.sale_count(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.sale_count(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.sale_count(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.sale_count(body: body)["Data"].keys).to include(
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

        describe "#sale_price_median" do
          it "raises error if body is nil" do
            expect { subject.sale_price_median(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.sale_price_median(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.sale_price_median(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.sale_price_median(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.sale_price_median(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.sale_price_median(body: body)["Data"].keys).to include(
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

        describe '#sale_price_median_trend' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.sale_price_median_trend(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.sale_price_median_trend(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.sale_price_median_trend(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.sale_price_median_trend(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.sale_price_median_trend(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.sale_price_median_trend(body: body)["Data"].keys).to include(
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

        describe "#sale_discount_median" do
          it "raises error if body is nil" do
            expect { subject.sale_discount_median(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.sale_discount_median(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.sale_discount_median(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.sale_discount_median(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.sale_discount_median(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.sale_discount_median(body: body)["Data"].keys).to include(
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

        describe '#sale_listing_count' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.sale_listing_count(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.sale_listing_count(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.sale_listing_count(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.sale_listing_count(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.sale_listing_count(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.sale_listing_count(body: body)["Data"].keys).to include(
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

        describe '#sale_listing_price_median' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.sale_listing_price_median(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.sale_listing_price_median(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.sale_listing_price_median(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.sale_listing_price_median(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.sale_listing_price_median(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.sale_listing_price_median(body: body)["Data"].keys).to include(
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
      end

      context "lease module" do
        describe '#lease_listing_count' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.lease_listing_count(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.lease_listing_count(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.lease_listing_count(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.lease_listing_count(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.lease_listing_count(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.lease_listing_count(body: body)["Data"].keys).to include(
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

        describe '#lease_listing_price_median' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.lease_listing_price_median(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.lease_listing_price_median(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.lease_listing_price_median(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.lease_listing_price_median(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.lease_listing_price_median(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.lease_listing_price_median(body: body)["Data"].keys).to include(
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

        describe '#lease_listing_price_median_trend' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.lease_listing_price_median_trend(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.lease_listing_price_median_trend(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.lease_listing_price_median_trend(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.lease_listing_price_median_trend(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.lease_listing_price_median_trend(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.lease_listing_price_median_trend(body: body)["Data"].keys).to include(
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
      end

      context "yield module" do
        describe '#yeild_trend' do
          let(:body) {
            {
              "Filter": {
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
          }

          it "raises error if body is nil" do
            expect { subject.yeild_trend(body: nil) }.to raise_error(ArgumentError, "No body specified")
          end

          it "raises error if body is not a hash" do
            expect { subject.yeild_trend(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
          end

          it "returns the correct keys" do
            expect(subject.yeild_trend(body: body).keys).to include("Status", "Message", "Data")
          end

          it "returns the correct status" do
            expect(subject.yeild_trend(body: body)["Status"]).to eq("ok")
          end

          it "returns the correct message" do
            expect(subject.yeild_trend(body: body)["Message"]).to eq(nil)
          end

          it "returns the correct data keys" do
            expect(subject.yeild_trend(body: body)["Data"].keys).to include(
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
      end
    end

    context "spatial module" do
      describe '#suburb_find' do
        let(:body) {
          {
            "Filter": {
              "SuburbName": "New Lambton",
              "PostcodeName": "2305",
              "StateName": "NSW"
            }
          }
        }

        it "raises error if body is nil" do
          expect { subject.suburb_find(body: nil) }.to raise_error(ArgumentError, "No body specified")
        end

        it "raises error if body is not a hash" do
          expect { subject.suburb_find(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
        end

        it "returns the correct keys" do
          expect(subject.suburb_find(body: body).keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.suburb_find(body: body)["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.suburb_find(body: body)["Message"]).to eq(nil)
        end

        it "returns the correct data keys" do
          expect(subject.suburb_find(body: body)["Data"].keys).to include(
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

      describe '#address_find' do
        let(:body) {
          {
            "Filter": {
              "AddressName": "2 Lille Street",
              "SuburbName": "New Lambton",
              "PostcodeName": "2305",
              "StateName": "NSW"
            }
          }
        }

        it "raises error if body is nil" do
          expect { subject.address_find(body: nil) }.to raise_error(ArgumentError, "No body specified")
        end

        it "raises error if body is not a hash" do
          expect { subject.address_find(body: 1) }.to raise_error(ArgumentError, "Body must be a hash")
        end

        it "returns the correct keys" do
          expect(subject.address_find(body: body).keys).to include("Status", "Message", "Data")
        end

        it "returns the correct status" do
          expect(subject.address_find(body: body)["Status"]).to eq("ok")
        end

        it "returns the correct message" do
          expect(subject.address_find(body: body)["Message"]).to eq(nil)
        end

        it "returns the correct data keys" do
          expect(subject.address_find(body: body)["Data"].keys).to include(
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
    end
  end
end
