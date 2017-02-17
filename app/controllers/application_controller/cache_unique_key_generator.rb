class ApplicationController < ActionController::Base
  class CacheUniqueKeyGenerator
    def generate(key_parts = {})
      key_parts.sort.to_h.map { |key, value| "#{key}:#{value};" }.join
    end
  end
end
