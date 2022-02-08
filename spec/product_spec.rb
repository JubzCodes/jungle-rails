require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "product will be save to database" do
      category = Category.create(name: "Speakers")
      product = Product.create(name: "JBL", price: 89, quantity: 1, category: category)
      expect(product).to be_present
    end

    it "doesn't save if Name is missing" do
      category = Category.create(name: "Speakers")
      product = Product.create(name: nil, price: 89, quantity: 1, category: category)
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it "doesn't save if Price is missing" do
      category = Category.create(name: "Speakers")
      product = Product.create(name: "JBL", price: nil, quantity: 1, category: category)
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it "doesn't save if Quantity is missing" do
      category = Category.create(name: "Animals")
      product = Product.create(name: "JBL", price: 89, quantity: nil, category: category)
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "doesn't save if Category is missing" do
      category = Category.create(name: "Speakers")
      product = Product.create(name: "JBL", price: 89, quantity: 1, category: nil)
      expect(product.errors.full_messages).to include "Category can't be blank"
    end

  end
end