require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid user' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a username' do
    user = FactoryBot.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a duplicate username' do
    user1 = FactoryBot.create(:user, username: "admin001")
    user2 = FactoryBot.build(:user, username: "admin001")
    user2.valid?
    expect(user2.errors[:username]).to include("has already been taken")
  end
end
