require "damper/version"
require "damper/request_processor"
require "damper/request_forwarder"
require "damper/backend"
require "damper/adapter/redis"
require "reel"
require "json"

module Damper
  DEFAULT_HOST = "127.0.0.1"
  DEFAULT_PORT = 3000
end
