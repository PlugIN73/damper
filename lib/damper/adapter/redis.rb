require 'redis'

module Damper
  module Adapter
    class Redis
      attr_reader :connection
      def initialize(options)
        @connection = ::Redis.new(:timeout => 0)
      end

      def publish(channel, object)
        @connection.publish channel, object
      end

      def subscribe(channel)
        @connection.subscribe channel
      end

    end
  end
end
