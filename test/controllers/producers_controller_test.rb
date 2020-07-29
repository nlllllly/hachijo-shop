require 'test_helper'

class ProducersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producers_index_url
    assert_response :success
  end

end
