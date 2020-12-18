require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test "should not save entry without content" do
    entry = Entry.new
    assert_not entry.save
  end

  test "should not save entry without day_id" do
    entry = Entry.new
    assert_not entry.save
  end

  test "should not save entry without category_id" do
    entry = Entry.new
    assert_not entry.save
  end


  # test "the truth" do
  #   assert true
  # end
end
