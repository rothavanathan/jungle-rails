require 'rails_helper'

RSpec.feature "Visitor adds product to cart from home page", type: :feature, js: true do

   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products then click to add first product to cart" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot 'test3_home_page.png'
    expect(page).to have_text('My Cart (0)') 
    # ACT
    first('article.product footer button').click
    sleep(1)

    # DEBUG
    save_screenshot 'test3_check-cart.png'

    # VERIFY
    expect(page).to have_text('My Cart (1)')    
  end

end