#!/usr/bin/ruby -w
require './item'

items = []

begin
  puts "Please enter item details (Quantity, Product, Price)"
  line = gets.chomp
  item = Item.new( line)
  if !item.invalid
    items << item
  end

  puts "do you want to add another item?(y/n)"
  response = gets.chomp
end until response == "n"

total_price = 0.0
sales_tax = 0.0
items.each do |i|
  puts "#{i.qty}, #{i.name}, #{ '%.2f' % i.total_price.round(2)}"
  total_price += i.total_price
  sales_tax += i.sales_tax
end
puts "Sales Taxes: #{ '%.2f' % sales_tax.round(2)}"
puts "Total: #{ '%.2f' % total_price.round(2)}"
