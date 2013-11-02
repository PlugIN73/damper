
require 'celluloid'
module Damper
  class ForwardManager

    include Celluloid

    def initialize(options)
      @channel = options.delete(:channel)
    end

    def start
      client = Damper::Backend.redis
      describe_start

      pool = Damper::ForwardWorker.pool(size: 2)
      client.subscribe(@channel) do |on|
        on.message do |channel, msg|
          #data = JSON.parse(msg)
          pool.perform(msg)
        end
      end

    end

    def describe_start
      puts "Starting workers..."
      puts "Listening channel #{@channel}"
    end

  end
end
