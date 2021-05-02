require 'rails_helper'

RSpec.describe User, type: :model do
  it "Email、パスワード、名前を入力すれば、登録が成功する" do
    user = User.new(
      name: "ながしま",
      email: 1,
      password_digest: "pass"
      )
    expect(user.save).to eq true
    
    expect(user.email).to eq 1
  end
end