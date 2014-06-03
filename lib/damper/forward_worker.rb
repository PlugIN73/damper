require 'net/http'
require 'uri'
module Damper
  class ForwardWorker

    include Celluloid

    def perform(options)
      uri = URI.parse(options["callback_url"])
      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(options)
      response = http.request(request)
    end
  end
end
