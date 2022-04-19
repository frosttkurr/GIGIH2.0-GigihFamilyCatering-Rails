require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'has a valid order details' do
    expect(FactoryBot.build(:order_detail)).to be_valid
  end
end
