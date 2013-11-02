module Damper
  class Backend
    def self.redis(options=nil)
      Adapter::Redis.new(options)
    end
  end
end
