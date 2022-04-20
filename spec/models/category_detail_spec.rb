require 'rails_helper'

RSpec.describe CategoryDetail, type: :model do
  it 'has a valid category details' do
    expect(FactoryBot.build(:category_detail)).to be_valid
  end

  it 'is invalid without item id' do
    category_detail = FactoryBot.build(:category_detail, item_id: nil)
    category_detail.valid?
    expect(category_detail.errors[:item_id]).to include("can't be blank")
  end
  
  it 'is invalid without category id' do
    category_detail = FactoryBot.build(:category_detail, category_id: nil)
    category_detail.valid?
    expect(category_detail.errors[:category_id]).to include("can't be blank")
  end
end
