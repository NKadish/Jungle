require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "Creates a new user" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_valid
    end

    it "Should not be valid without a first name" do
      @user = User.new(first_name: nil, last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end

    it "Should not be valid without a last name" do
      @user = User.new(first_name: "Test", last_name: nil, email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end

    it "Should not be valid without an email" do
      @user = User.new(first_name: "Test", last_name: "Email", email: nil, password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end

    it "Should not be valid if password and confirmation are not the same" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "testing")
      expect(@user).to be_invalid
    end

    it "Should not be valid if the same email as an existing email is used (not case sensitive)" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      @user2 = User.new(first_name: "Test", last_name: "Test", email: "TEST@test.com", password: "test", password_confirmation: "test")
      expect(@user2).to be_invalid
    end

    it "Should not be valid if password length is less than 4" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "tes", password_confirmation: "tes")
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "Should return user if the credentials authenticate" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      auth = User.authenticate_with_credentials("test@test.com", "test")
      expect(auth).to eql(@user)
    end

    it "Should be nil if the credentials do not match " do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      auth = User.authenticate_with_credentials("test@test.com", "tests")
      expect(auth).to be_nil
    end

    it "Should authenticate with a couple of spaces in the email" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      auth = User.authenticate_with_credentials("  test@test.com  ", "test")
      expect(auth).to eql(@user)
    end

    it "Should authenticate with the wrong casing in the email" do
      @user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      auth = User.authenticate_with_credentials("TEST@test.com", "test")
      expect(auth).to eql(@user)
    end

  end
end
