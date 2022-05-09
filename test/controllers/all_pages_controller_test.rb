require 'test_helper'

class AllPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get all_pages_contact_url
    assert_response :success
  end

end
