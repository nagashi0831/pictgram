require 'rails_helper'
RSpec.feature "Comments", type: :feature do
  #ユーザーはコメントを投稿する
  scenario "user create a new comment" do
    #ユーザーを作成
    @user = User.create(
      name: "なそ",
      email: "test@example.com",
      password: "souta850831"
      )
      
    visit root_path
    
    click_link "Log in"
    
    expect(page).to have_content "Log in"
    expect(page).to have_field "Email"
    
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "ログイン"
    
    expect(page).to have_content "Make you Happy"
    
    visit new_topic_path
    
    attach_file 'topic_image', "#{Rails.root}/spec/fixtures/images/test.jpg"
    fill_in "Description", with: "PHPです"
    
    click_button '投稿'
    expect(page).to have_content '投稿に成功しました'
    
    @topic = Topic.first
    
    @comment = Comment.new(
      user_id: @user.id,
      topic_id: @topic.id,
      description: "とても美しい写真です！"
      )
    expect(@comment.save).to eq false
    #コメントページへ遷移
    page.all('a')[-1].click
    expect(page).to have_content "コメント画面"
    expect(page).to have_content "とても"
  end
end