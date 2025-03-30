require "test_helper"

class Api::HealthControllerTest < ActionDispatch::IntegrationTest
  test "should get ping" do
    get api_health_ping_url
    assert_response :success
  end
end
