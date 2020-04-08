class Item
  attr_accessor :name, :qty, :taxable, :imported, :price

  def initialize( name, qty, taxable, imported, price)
    if name.class == String && qty.class == Integer && price.class == Float &&
      (taxable.class == FalseClass || taxable.class == TrueClass) &&
      (imported.class == FalseClass || imported.class == TrueClass)
      @name = name
      @qty = qty
      @taxable = taxable
      @imported = imported
      @price = price
    else
      puts "Please try again, incorrect format"
    end
  end

  def import_tax
    self.imported ? line_price * 0.05 : 0
  end

  def sales_tax
    self.taxable ? line_price * 0.1 : 0
  end

  def total_price
    line_price + self.import_tax + self.sales_tax
  end

private
  def line_price
    self.qty * self.price
  end
end
