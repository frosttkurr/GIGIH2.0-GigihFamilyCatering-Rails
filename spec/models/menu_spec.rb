require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'has a valid menu' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is invalid without name' do
    menu = FactoryBot.build(:menu, name: nil)
    menu.valid?
    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without price' do
    menu = FactoryBot.build(:menu, price: nil)
    menu.valid?
    expect(menu.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without description' do
    menu = FactoryBot.build(:menu, description: nil)
    menu.valid?
    expect(menu.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    menu1 = FactoryBot.create(:menu, name: "Ayam Bakar")
    menu2 = FactoryBot.build(:menu, name: "Ayam Bakar")
    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a price less than 0.01' do
    food = FactoryBot.build(:menu, price: 0.00)
    food.valid?
    expect(food.errors[:price]).to include("must be greater than 0.01")
  end

  it 'is invalid with length more than 150 characters' do
    food = FactoryBot.build(:menu, description: "The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages. It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is.The European languages are members of the same that is used by")
    food.valid?
    expect(food.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  it 'is invalid with non numeric values for price' do
    food = FactoryBot.build(:menu, price: "Lima ribu")
    food.valid?
    expect(food.errors[:price]).to include("is not a number")
  end
end
