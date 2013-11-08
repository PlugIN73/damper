require "./test/test_helper.rb"
require "minitest/autorun"
require "wrong"
class ForwardWorkerTest < Minitest::Test
  include Wrong

  def setup
    @request_options = {"method"=>"get",
                       "request_uri"=>"/",
                       "headers"=>{"User-Agent"=>"httperf/0.9.0",
                       "Host"=>"127.0.0.1"},
                       "body"=>"",
                       "forward_to"=>"http://localhost:3000/"
    }
  end

  def test_should_forward_request
    stub_request(:get, "http://localhost:3000/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'127.0.0.1', 'User-Agent'=>'httperf/0.9.0'}).
      to_return(:status => 200, :body => "", :headers => {})

    Damper::ForwardWorker.pool.perform(@request_options.to_json)

    assert {true == true}
  end
end
