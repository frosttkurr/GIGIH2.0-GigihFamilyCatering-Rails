require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid item' do
    expect(FactoryBot.build(:item)).to be_valid
  end
end
