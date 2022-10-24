require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context "given valid inputs" do
      it "validates the entry" do
        @category = Category.new(id: 1, name: "new category")
        @product = Product.new(name: "valid name", price_cents: 1200, quantity: 6, category: @category)
        expect(@product).to be_valid
      end
    end

    context "given nil for name input" do
      it "fails validation for name" do
        @category = Category.new(id: 1, name: "new category")
        @product = Product.new(name: nil, price_cents: 1200, quantity: 6, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "given nil for price input" do
      it "fails validation for price" do
        @category = Category.new(id: 1, name: "new category")
        @product = Product.new(name: "valid name", price_cents: nil, quantity: 6, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context "given nil for quantity input" do
      it "fails validation for quantity" do
        @category = Category.new(id: 1, name: "new category")
        @product = Product.new(name: "valid name", price_cents: 1200, quantity: nil, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "given nil for category input" do
      it "fails validation for category" do
        @category = Category.new(id: 1, name: "new category")
        @product = Product.new(name: "valid name", price_cents: 1200, quantity: 6, category: nil)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
