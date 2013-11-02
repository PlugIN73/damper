require "damper/version"
require "damper/request_processor"
require 'reel'

module Damper
  d = Damper::RequestProcessor.new
  d.start
end
