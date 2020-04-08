require 'spec_helper'

describe Item do

  describe "#new" do
    it "returns new Item" do
      item = Item.new("Chocolate", 1, false, false, 10.00)
      expect item.class == Item
    end
  end

  describe "Item operations" do
    before :each do
      @item = Item.new("Chocolate", 1, true, true, 10.00)
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
