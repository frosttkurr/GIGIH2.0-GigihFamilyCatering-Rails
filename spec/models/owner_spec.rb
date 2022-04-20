require 'rails_helper'

RSpec.describe Owner, type: :model do
  it 'has a valid owner' do
    expect(FactoryBot.build(:owner)).to be_valid
  end

  it 'is invalid without a name' do
    owner = FactoryBot.build(:owner, name: nil)
    owner.valid?
    expect(owner.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a username' do
    owner = FactoryBot.build(:owner, username: nil)
    owner.valid?
    expect(owner.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    owner = FactoryBot.build(:owner, password: nil)
    owner.valid?
    expect(owner.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a duplicate username' do
    owner1 = FactoryBot.create(:owner, username: "admin001")
    owner2 = FactoryBot.build(:owner, username: "admin001")
    owner2.valid?
    expect(owner2.errors[:username]).to include("has already been taken")
  end
end
