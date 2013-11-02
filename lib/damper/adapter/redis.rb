require 'redis'

module Damper
  module Adapter
    class Redis
      def initialize(options)
        @connection = ::Redis.new
        @namespace = options[:namespace]
      end

      def save(object)
        @connection.lpush(@namespace, object)
      end
    end
  end
end
