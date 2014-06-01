require "damper/version"
require "damper/supported_langs"
require "damper/request_processor"
require "damper/forward_manager"
require "damper/forward_worker"
require "damper/backend"
require "damper/adapter/redis"

require "reel"
require "json"

module Damper
  DEFAULT_HOST = "0.0.0.0"
  DEFAULT_PORT = 3000
end
