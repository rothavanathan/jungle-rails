require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'will save with all four fields set' do
    @food = Category.new(name: "Food")
    @food.save
    @food.products.create(name: 'Chips', price: 300, quantity: 5)
    @food.save
    byebug
    expect(@food).to be_valid
  end

  describe 'Validations' do
    # validation tests/examples here

  end
end
