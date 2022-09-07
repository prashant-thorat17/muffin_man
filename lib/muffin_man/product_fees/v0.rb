# frozen_string_literal: true

module MuffinMan
  module ProductFees
    require "json"
    require "sp_api_helper"
    class V0 < SpApiClient
      attr_reader :asin
      #TODO: Allow api to send their own identifier
      def get_my_fees_estimate_for_asin(asin, marketplace_id, map_price, currency_code)
        @asin = asin
        @local_var_path = "/products/fees/v0/items/#{@asin}/feesEstimate"
        @request_body = JSON.parse(SpApiHelper.fees_estimate_request_body(
          marketplace_id,
          map_price,
          currency_code).to_json).deep_transform_keys(&:camelize)
        @request_type = "POST"
        call_api
      end
    end
  end
end
