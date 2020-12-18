require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test "should not save image without day_id" do
    image = Image.new
    assert_not image.save
  end

  test "should not save image without caption" do
    image = Image.new
    assert_not image.save
  end

  test "should not save image without url" do
    image = Image.new
    assert_not image.save
  end
  # test "the truth" do
  #   assert true
  # end
end
