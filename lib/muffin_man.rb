require "muffin_man/version"
require "muffin_man/sp_api_client"
require "muffin_man/lwa/auth_helper"
require "muffin_man/solicitations/v1"
require "muffin_man/orders/v0"
require "muffin_man/reports/v20210630"
require "muffin_man/catalog_items/v20201201"
require "muffin_man/catalog_items/v20220401"
require "muffin_man/finances/v0"
require "muffin_man/product_fees/v0"
require "muffin_man/authorization/v1"
require "muffin_man/tokens/v20210301"
require "muffin_man/product_pricing/v0"
require "muffin_man/listings/v20210801"
require "muffin_man/fulfillment_inbound/v0"
require "muffin_man/fulfillment_inbound/v1"
require "muffin_man/feeds/v20210630"
require "muffin_man/notifications/v1"
require "muffin_man/fba_inventory/v1"

module MuffinMan
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :save_access_token, :get_access_token
  end
end
