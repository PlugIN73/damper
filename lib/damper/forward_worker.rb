require 'net/http'
require 'uri'
module Damper
  class ForwardWorker

    include Celluloid

    def perform(options)
      #data = JSON.parse(options)
      uri = URI.parse("http://0.0.0.0:3000/callback_url")
      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Post.new(uri.path)
      response = http.request(request)
      puts response
    end
  end
end
