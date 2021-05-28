require 'rails_helper'
describe 'GET #index', type: :feature do
  before do
    #以下を元々存在しているコメントとする
    comment = Comment.new(
      topic_id: 1,
      user_id: 1,
      description: "きれい"
      )
    expect(comment.save).to eq true
    
    #以下を今回追加したコメントとする
    @params = {
      "topic_id"=>"1",
      "user_id"=>"2",
      "description"=>"きれいだね"
    }
  end
  
  it "正しいビューに遷移する" do
    visit "comments/index?topic_id=1"
    expect(page).to have_field 'office'
  end
  
  it "@commentsが期待される値を持つ" do
    @comments = Comment.find_by(topic_id: 1)
    expect(@comments.description).to eq "きれい"
  end
  
  it "追加されたコメントを正しく保存できている" do
    comment = Comment.new
    comment.user_id = @params[:user_id]
    comment.topic_id = @params[:topic_id]
    comment.description = @params[:description]
    expect(comment.save).to eq true
  end
end