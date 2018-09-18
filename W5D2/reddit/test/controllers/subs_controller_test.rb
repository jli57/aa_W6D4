require 'test_helper'

class SubsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subs_new_url
    assert_response :success
  end

  test "should get create" do
    get subs_create_url
    assert_response :success
  end

end
