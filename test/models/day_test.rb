require 'test_helper'

class DayTest < ActiveSupport::TestCase

  test "should not save day without name" do
    day = Day.new
    assert_not day.save
  end

  test "should not save day without date" do
    day = Day.new
    assert_not day.save
  end

  test "should not allow duplicate day dates" do
    day1 = Day.create(name: "Saturday", date: "2020-12-13")
    day2 = Day.create(name: "Saturday", date: "2020-12-13")
    assert_not day2.save
  end


  # test "the truth" do
  #   assert true
  # end
end
