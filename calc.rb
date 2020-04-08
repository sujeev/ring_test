#!/usr/bin/ruby -w
require './item'

  def taxable( name)
    taxable_words = ["chocolate", "book", "pill"]
    taxable_words.each do |word|
      if name.include? word
        return false
        break
      end
    end
    return true
  end


items = []

begin
  puts "Please enter item details (Quantity, Product, Price)"
  line = gets.chomp
  line_ar = line.split(",")
  if line_ar.count == 3
    item = Item.new( line_ar[1].strip, line_ar[0].strip.to_i, taxable( line_ar[1]), line_ar[1].include?("import"), line_ar[2].strip.to_f)
    items << item
  else
    puts "Please try again, incorrect format"
  end

  puts "do you want to add another item?(y/n)"
  response = gets.chomp
end until response == "n"

total_price = 0.0
sales_tax = 0.0
items.each do |item|

  puts "#{item.qty}, #{item.name}, #{ '%.2f' % item.total_price.round(2)}"
  total_price += item.total_price
  sales_tax += item.sales_tax
end
puts "Sales Taxes: #{ '%.2f' % sales_tax.round(2)}"
puts "Total: #{ '%.2f' % total_price.round(2)}"
