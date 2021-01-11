require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'will save with all four fields set' do
    @food = Category.new(name: "Food")
    @food.save
    expect(@food.products.create(name: 'Chips', price: 300, quantity: 5)).to be_valid
  end

  describe 'Validations' do
    # validation tests/examples here
    it 'is not valid without a name' do
      @food = Category.new(name: "Food")
      @food.save  
      expect(@food.products.create(name: nil, price: 300, quantity: 5)).to_not be_valid
    end

    it 'is not valid without a price' do
      @food = Category.new(name: "Food")
      @food.save  
      expect(@food.products.create(name: 'Chips', price: nil, quantity: 5)).to_not be_valid
    end

    it 'is not valid without a quality' do
      @food = Category.new(name: "Food")
      @food.save  
      expect(@food.products.create(name: 'Chips', price: 300, quantity: nil)).to_not be_valid
    end

    it 'is not valid without a category' do 
      expect(Product.new(name: 'Chips', price: 300, quantity: 5)).to_not be_valid
    end

  end
end
