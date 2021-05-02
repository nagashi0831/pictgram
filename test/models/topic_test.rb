require "test_helper"

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "本文が無い記事は投稿してはいけない" do
    topic = Topic.new
    topic[:user_id] = 1
    topic[:description] = "あ"
    topic[:image] = "aaa.png"
    assert topic.save
  end
end
