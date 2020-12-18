require 'test_helper'

class Api::V1::DaysControllerTest < ActionDispatch::IntegrationTest

  test "should create day" do
    assert_difference('Day.count') do
      post api_v1_days_url, params: { day: {:name => "Tuesday", :date => "2020-12-15"}}
      
    end
  end
  #  end
  #end
  test "should get index" do
    get api_v1_days_url
    assert_response :success
  end

  test "should destroy day" do
    @day = days(:one)
    assert_difference("Day.count", -1) do
      delete api_v1_day_url(@day)
    end
  end


  # test "the truth" do
  #   assert true
  # end
end
