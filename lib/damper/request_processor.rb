module Damper
  class RequestProcessor
    def start
      puts 'Starting reel web server'
      Reel::Server.run('127.0.0.1', 3000) do |connection|
        connection.each_request do |request|
          request.respond :ok, "hello, world!"
        end
      end
    end
  end
end
