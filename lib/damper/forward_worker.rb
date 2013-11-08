require 'net/http'
require 'uri'
module Damper
  class ForwardWorker
    
    include Celluloid

    def perform(options)
      data = JSON.parse(options)
      url = URI.parse(data["forward_to"])
      request = Net::HTTP.new(url.host, url.port)
      response = request.send_request(data["method"].upcase, data["request_uri"], data["body"], data["headers"])
      puts response.inspect
    end
  end
end
