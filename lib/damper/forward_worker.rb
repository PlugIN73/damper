module Damper
  class ForwardWorker
    
    include Celluloid

    def perform(options)
      puts self.inspect
    end
  end
end
