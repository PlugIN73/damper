module Damper
  class Backend
    def self.redis(options)
      Adapter::Redis.new(options)
    end
  end
end
