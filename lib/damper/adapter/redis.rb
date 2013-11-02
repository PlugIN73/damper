require 'redis'

module Damper
  module Adapter
    class Redis
      def initialize(options)
        @connection = ::Redis.new(:timeout => 0)
        @channel = options[:channel]
      end

      def save(object)
        @connection.publish @channel, object
      end
    end
  end
end
