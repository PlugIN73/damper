require 'cgi'

module Damper
  class RequestProcessor

    def initialize(options)
      @namespace = options.delete(:namespace)
      @host = options.delete(:host) || Damper::DEFAULT_HOST
      @port = options.delete(:port) || Damper::DEFAULT_PORT
    end

    def start
      describe_start
      Reel::Server.run(@host, @port) do |connection|
        connection.each_request do |request|
          serve request
        end
      end
    end

    def serve (request)
      client = Damper::Backend.redis
      if (request.path == "/")
        if (CGI::parse(request.body.to_s)["callback_url"].first)

          if (check_lang CGI::parse(request.body.to_s)["lang"].first, CGI::parse(request.body.to_s)["version"].first)
            client.publish @namespace, prepare_data(request)
            request.respond :ok, "message recieved"
          else
            request.respond :bad_request, "lang is incorrect"
          end
        else
          request.respond :bad_request, "callback url not specified"
        end
      end

      if (request.path == "/get_langs" || request.path == "/get_langs/")
        request.respond :ok, Damper::SUPPORTED_LANGS.to_json
      end
      request.respond :not_found

    end

    def check_lang lang, version
      Damper::SUPPORTED_LANGS.find { |language|
        language[:name] == lang && language[:version] == version
      }
    end

    def prepare_data(request)
      {
        code: CGI::parse(request.body.to_s)["code"].first,
        callback_url: CGI::parse(request.body.to_s)["callback_url"].first,
        lang: CGI::parse(request.body.to_s)["lang"].first,
        version: CGI::parse(request.body.to_s)["version"].first,
        id: "#{CGI::parse(request.body.to_s)["lang"].first}-#{Time.now.to_i}",
        mode: "run",
      }.to_json
    end

    def describe_start
      puts "Starting reel web server..."
      puts "Listening on #{@host}:#{@port}"
    end

  end
end
