require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid item' do
    expect(FactoryBot.build(:item)).to be_valid
  end

  it 'is invalid without name' do
    item = FactoryBot.build(:item, name: nil)
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without price' do
    item = FactoryBot.build(:item, price: nil)
    item.valid?
    expect(item.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without description' do
    item = FactoryBot.build(:item, description: nil)
    item.valid?
    expect(item.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    item1 = FactoryBot.create(:item, name: "Ayam Bakar")
    item2 = FactoryBot.build(:item, name: "Ayam Bakar")
    item2.valid?
    expect(item2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a price less than 0.01' do
    food = FactoryBot.build(:item, price: 0.00)
    food.valid?
    expect(food.errors[:price]).to include("must be greater than 0.01")
  end

  it 'is invalid with length more than 150 characters' do
    food = FactoryBot.build(:item, description: "The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages. It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is.The European languages are members of the same that is used by")
    food.valid?
    expect(food.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  it 'is invalid with non numeric values for price' do
    food = FactoryBot.build(:item, price: "Lima ribu")
    food.valid?
    expect(food.errors[:price]).to include("is not a number")
  end
end
