module Damper
  class Backend
    def self.redis(options=nil)
      client = Adapter::Redis.new(options)
      client.connection
    end
  end
end
