require 'rails_helper'

RSpec.feature "Visitor navigates to product page from home page", type: :feature, js: true do

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

  scenario "They see all products then click on first product " do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot 'test2_home_page.png'
    expect(page).to have_css('.product')    
    # ACT
    first('article.product img').click
    sleep(1)

    # DEBUG
    save_screenshot 'test2_product_show.png'

    # VERIFY
    expect(page).to have_css('.products-show')    
  end

end
