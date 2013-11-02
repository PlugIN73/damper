require "damper/version"
require "damper/request_processor"
require "damper/backend"
require "damper/adapter/redis"
require 'reel'

module Damper
  d = Damper::RequestProcessor.new
  d.start
end
