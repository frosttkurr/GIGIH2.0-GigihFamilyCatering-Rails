require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a valid order' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is invalid without owner id' do
    order = FactoryBot.build(:order, owner_id: nil)
    order.valid?
    expect(order.errors[:owner_id]).to include("can't be blank")
  end

  it 'is invalid without customer email' do
    order = FactoryBot.build(:order, customer_email: nil)
    order.valid?
    expect(order.errors[:customer_email]).to include("can't be blank")
  end

  it 'is invalid without total to be paid' do
    order = FactoryBot.build(:order, total: nil)
    order.valid?
    expect(order.errors[:total]).to include("can't be blank")
  end

  it 'is invalid without a status' do
    order = FactoryBot.build(:order, status: nil)
    order.valid?
    expect(order.errors[:status]).to include("can't be blank")
  end

  it 'is invalid with invalid email' do
    order = FactoryBot.build(:order, customer_email: "halo@gigih")
    order.valid?
    expect(order.errors[:customer_email]).to include("is invalid")
  end

  it 'is invalid with invalid status' do
    order = FactoryBot.build(:order, status: "PENDING")
    order.valid?
    expect(order.errors[:status]).to include("is not a valid status")
  end
end
