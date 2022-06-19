require "test_helper"

class ChecklistItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checklist_items_index_url
    assert_response :success
  end
end
