require_relative "test_helper"

class TestController < Rulers::Controller
  def index
    "Hello!" #Not rendering a view
  end
end

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/route"

    assert last_response.ok?
    body = last_response.body
  end

  def test_way
    get "/example/route"

    assert last_response.body["Hello!"]
  end

  # def test_request_practice
  #   get "/"

  #   assert last_response.ok?
  #   body = last_response.body
  #   assert body["Rulers"]
  # end
end