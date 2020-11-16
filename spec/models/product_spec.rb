require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "Creates a product" do
      @category = Category.new
      @product = Product.new(name: "Testing", price: 1, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it "Is not valid without a name" do
      @category = Category.new
      @product = Product.new(name: nil, price: 1, quantity: 1, category: @category)
      expect(@product).to be_invalid
    end

    it "Is not valid without a price" do
      @category = Category.new
      @product = Product.new(name: "Testing", price: nil, quantity: 1, category: @category)
      expect(@product).to be_invalid
    end

    it "Is not valid without a quantity" do
      @category = Category.new
      @product = Product.new(name: "Testing", price: 1, quantity: nil, category: @category)
      expect(@product).to be_invalid
    end

    it "Is not valid without a category" do
      @category = Category.new
      @product = Product.new(name: "Testing", price: 1, quantity: 1, category: nil)
      expect(@product).to be_invalid
    end
  end
end
