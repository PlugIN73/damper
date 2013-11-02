module Damper
  class ForwardWorker
    
    include Celluloid

    def perform(options)
      puts options
    end
  end
end
