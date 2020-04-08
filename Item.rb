class Item
  attr_accessor :name, :qty, :taxable, :imported, :price, :invalid

  def initialize( line)
    line_ar = line.split(",")
    if line_ar.count == 3
      name = line_ar[1].strip
      qty = line_ar[0].strip.to_i
      taxable = is_taxable( line_ar[1])
      imported = line_ar[1].include?("import")
      price = line_ar[2].strip.to_f

      if name.class == String && qty.class == Integer && price.class == Float &&
        (taxable.class == FalseClass || taxable.class == TrueClass) &&
        (imported.class == FalseClass || imported.class == TrueClass)
        @name = name
        @qty = qty
        @taxable = taxable
        @imported = imported
        @price = price
        @invalid = false
      else
        puts "Please try again, incorrect format"
        @invalid = true
      end
    else
      puts "Please try again, incorrect format"
      @invalid = true
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

  def is_taxable( name)
    taxable_words = ["chocolate", "book", "pill"]
    taxable_words.each do |word|
      if name.include? word
        return false
      end
    end
    return true
  end

end
