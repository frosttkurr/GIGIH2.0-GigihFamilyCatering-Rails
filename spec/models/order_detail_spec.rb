require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'has a valid order details' do
    expect(FactoryBot.build(:order_detail)).to be_valid
  end

  it 'is invalid without order id' do
    order_detail = FactoryBot.build(:order_detail, order_id: nil)
    order_detail.valid?
    expect(order_detail.errors[:order_id]).to include("can't be blank")
  end
  
  it 'is invalid without item id' do
    order_detail = FactoryBot.build(:order_detail, item_id: nil)
    order_detail.valid?
    expect(order_detail.errors[:item_id]).to include("can't be blank")
  end
end
