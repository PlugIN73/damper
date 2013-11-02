require 'net/http'
require 'uri'
module Damper
  class ForwardWorker
    
    include Celluloid

    def perform(options)
      data = JSON.parse(options)
      #TODO use assync
      url = URI.parse("http://127.0.0.1:3000")
      request = Net::HTTP.new(url.host, url.port)
      request.send_request(data["method"].upcase, data["request_uri"], data["body"], data["headers"])
    end
  end
end
