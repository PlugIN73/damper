require "./test/test_helper.rb"
require "minitest/autorun"
require "wrong"
class ForwardManagerTest < Minitest::Test
  include Wrong

  def setup
    @worker = Damper::ForwardWorker.new
  end

  def test_should_forward_request
    response = Net::HTTPResponse.new('1.1', '200', 'OK')
    Damper::ForwardWorker.expects(:perform).returns(response)
    response = Damper::ForwardWorker.perform(@request_options.to_json)

    assert {response.code == "200"}
  end

  def test_should_fail
  end
end
