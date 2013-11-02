require 'redis'

module Damper
  class RequestProcessor
    def start
      client = Damper::Backend.redis("namespace" => "test")
      puts 'Starting reel web server'
      Reel::Server.run('127.0.0.1', 3000) do |connection|
        connection.each_request do |request|
          client.save(request.body.object_id)
          request.respond :ok, "hello, world!"
        end
      end
    end
  end
end
