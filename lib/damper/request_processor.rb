require 'redis'

module Damper
  class RequestProcessor
    def start
      redis_client = Redis.new
      puts 'Starting reel web server'
      Reel::Server.run('127.0.0.1', 3000) do |connection|
        connection.each_request do |request|
          redis_client.set('foo','bar')
          request.respond :ok, "hello, world!"

          data = redis_client.get('foo')

          puts data
        end
      end
    end
  end
end
