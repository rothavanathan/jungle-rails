require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'will save with all four fields set' do
    @food = Category.new(name: "Food")
    @food.save
    @food.products.create(name: 'Chips', price: 300, quantity: 5)
    @food.save!
  end

  describe 'Validations' do
    # validation tests/examples here
    it 'is not valid without a name' do
      @food = Category.new(name: "Food")
      @food.save  
      @food.products.create(name: nil, price: 300, quantity: 5)
      @food.save
      expect(@food.errors.messages).to include(:products=>["is invalid"])
    end

    it 'is not valid without a price' do
      @food = Category.new(name: "Food")
      @food.save  
      @food.products.create(name: 'Chips', price: nil, quantity: 5)
      @food.save
      expect(@food.errors.messages).to include(:products=>["is invalid"])
    end

    it 'is not valid without a quality' do
      @food = Category.new(name: "Food")
      @food.save  
      @food.products.create(name: 'Chips', price: 300, quantity: nil)
      @food.save
      expect(@food.errors.messages).to include(:products=>["is invalid"])
    end

    it 'is not valid without a category' do 
      @product = Product.new(name: 'Chips', price: 300, quantity: 5)
      @product.save
      expect(@product.errors.messages).to include(:category=>["can't be blank"])
    end

  end
end
