require 'rails_helper'

RSpec.describe CategoryDetail, type: :model do
  it 'has a valid category details' do
    expect(FactoryBot.build(:category_detail)).to be_valid
  end
end
