require 'rails_helper'

RSpec.describe User, type: :model do
  it 'will save when passwords match' do
    @new_user = User.new(name: "Popeye", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
    @new_user.save!
  end
  
  it 'will save when not all fields are provided' do
    @new_user = User.new(email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
    @new_user.save!
  end

  it 'will not save when passwords do not match' do
    @new_user = User.new(name: "Popeye", email: "popeye@gmail.com", password: "password123", password_confirmation: "watermelon123")
    @new_user.save
    expect(@new_user.errors.messages).to include(:password_confirmation=>["doesn't match Password"])
  end


end
