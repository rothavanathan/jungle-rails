require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'will save when passwords match' do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user.save!
    end
    
    
    
    it 'will not save when passwords do not match' do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com",password: "password123", password_confirmation: "watermelon123")
      @new_user.save
      expect(@new_user.errors.messages).to include(:password_confirmation=>["doesn't match Password"])
    end
    
    it 'will save when email is unique' do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user.save
      @new_user2 = User.new(first_name: "Jurgen", last_name: "Potter", email: "hooray@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user2.save
    end
    
    it 'will not save when email is not unique' do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user.save
      @new_user2 = User.new(first_name: "Jurgen", last_name: "Potter", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user2.save
      expect(@new_user2.errors.messages).to include(:email=>["has already been taken"])
    end
    
    it 'will not save when password is less than 5 characters long' do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com", password: "pass", password_confirmation: "pass")
      @new_user.save
      
      expect(@new_user.errors.messages).to include(:password=>["is too short (minimum is 5 characters)"])
    end
  end
    
  describe '.authenticate_with_credentials' do
    it "will return a user if user has correct authentication info" do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user.save!
      result = @new_user.authenticate_with_credentials('popeye@gmail.com', 'password123')
      expect(result).to be_instance_of(User)
    end
    
    it "will return nil if user has correct authentication info" do
      @new_user = User.new(first_name: "Popeye", last_name: "Jones", email: "popeye@gmail.com", password: "password123", password_confirmation: "password123")
      @new_user.save!
      result = @new_user.authenticate_with_credentials('popeye@gmail.com', 'passw23')
      expect(result).to be_nil
    end
  end
end
