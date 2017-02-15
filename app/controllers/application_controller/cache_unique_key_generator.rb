class ApplicationController < ActionController::Base
  class CacheUniqueKeyGenerator
    def initialize(api_request, request_options = {})
      @api_request = api_request
      @request_options = request_options
    end

    # TODO
    def generate
      unique_key = @api_request.required_args
      unique_key = unique_key.transform_values { |value| value.to_s }
      unique_key = unique_key.merge(@request_options)
      unique_key.sort.to_h.map { |k, v| "#{k}/#{v};" }.join
    end
  end
end
