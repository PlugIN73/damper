require 'redis'

module Damper
  module Adapter
    class Redis
      def initialize(options)
        @connection = ::Redis.new
        @namespace = options["namespace"]
      end

      def save(object)
        @connection.lpush(@namespace, object)
        puts "Object pushed to redis"
      end
    end
  end
end
