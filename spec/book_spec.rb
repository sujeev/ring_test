require 'spec_helper'

describe Item do

  describe "#new" do
    it "return invalid item when no data exist" do
      item = Item.new("")
      expect item.invalid
    end
    it "return invalid item for no name" do
      item = Item.new("1, , 10")
      expect item.invalid
    end
    it "return invalid item for no qty" do
      item = Item.new(", chocolate, 10")
      expect item.invalid
    end
    it "return invalid item for no price" do
      item = Item.new("1, chocolate,")
      expect item.invalid
    end

    it "returns new Item" do
      item = Item.new("1, chocolate bar, 10")
      expect !item.invalid
    end
    it "verify item is imported" do
      item = Item.new("1, imported chocolate, 20")
      expect item.imported
    end
    it "verify item is NOT imported" do
      item = Item.new("1, chocolate, 20")
      expect !item.imported
    end
    it "verify item is taxable" do
      item = Item.new("1, liqour, 200")
      expect item.taxable
    end
    it "verify item is NOT taxable" do
      item = Item.new("1, book, 12")
      expect !item.taxable
    end
  end

  describe "Item operations" do
    before :each do
      @item = Item.new("1, imported liqour, 10")
    end

    it "calculate sales tax" do
      expect @item.sales_tax == 1
    end

    it "calculate import tax" do
      expect @item.import_tax == 0.5
    end

    it "calculate total price" do
      expect @item.total_price == 11.5
    end
  end
end
