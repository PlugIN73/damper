require 'net/http'
require 'uri'
module Damper
  class ForwardWorker

    include Celluloid

    def perform(options)
      uri = URI(options["callback_url"])
      uri.query = "#{uri.query}&#{URI.encode_www_form(options)}"

      response = Net::HTTP.get_response(uri)
    end
  end
end
