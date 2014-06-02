require 'redis'

module Damper
  module Adapter
    class Redis
      attr_reader :connection
      def initialize(options)
        @connection = ::Redis.new(:timeout => 0)
      end

      def publish(namespace, object)
        @connection.lpush namespace, object
      end

      def get(namespace)
        @connection.brpop namespace
      end

    end
  end
end
