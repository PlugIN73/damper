
require 'celluloid'
module Damper
  class ForwardManager

    include Celluloid

    def initialize(options)
      @channel = options.delete(:channel)
      @client = Damper::Backend.redis
    end

    def start
      describe_start

      pool = Damper::ForwardWorker.pool(size: 2)
      queue, result = @client.get(@channel)
      pool.perform(result)

    end

    def describe_start
      puts "Starting workers..."
      puts "Listening channel #{@channel}"
    end

  end
end
