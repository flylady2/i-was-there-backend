require 'test_helper'

class Api::V1::EntriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should update entry" do
    @entry = entries(:one)

    patch api_v1_entry_url(@entry), params: {newContent: "updated", entry: {id: @entry.id}}
    #byebug
    @entry.reload
    assert_equal "updated", (entries(:one)).content
  end
end
    #@entry.update(content: params["newContent"])
#assert_equal "MyString2", Collection.find(collections(:one)).name
