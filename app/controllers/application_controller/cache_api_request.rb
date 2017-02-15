class ApplicationController < ActionController::Base
  class CacheApiRequest
    def initialize(api_request, request_options = {})
      @api_request = api_request
      @request_options = request_options
    end

    def call(unique_key, cache_options = {})
      APICache.get(unique_key, cache_options) do
        @api_request.call(@request_options)
      end
    end
  end
end
