module Damper
  class RequestForwarder
    def start
      client = Damper::Backend.redis("namespace" => "test")
      puts 'Starting request forwarder server'
      client.save(request.body.object_id)
      request.respond :ok, "hello, world!"
    end
  end
end
