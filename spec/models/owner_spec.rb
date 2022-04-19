require 'rails_helper'

RSpec.describe Owner, type: :model do
  it 'has a valid owner' do
    expect(FactoryBot.build(:owner)).to be_valid
  end
end
