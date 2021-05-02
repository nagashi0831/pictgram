require "test_helper"

class TopicsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @topics = Topic.all.includes(:favorite_users)
  end
  
  test "should get new" do
    get topics_new_url
    if @topics.save
      assert true
      assert_response :success
    else
      assert false
    end
  end
  
  test "should not save article without title" do
    topic = Topic.new
    assert_not topic.save
  end  
end
