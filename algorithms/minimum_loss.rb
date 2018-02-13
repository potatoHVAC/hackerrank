#!/bin/ruby
#https://www.hackerrank.com/challenges/minimum-loss/problem
#completed 1/23/18

def generate_index_hash(price_array)
  index_hash = {}
  price_array.each_with_index { |price, i| index_hash[price.to_s.to_sym] = i }
  return index_hash
end

def generate_loss_list(price_array)
  price_sorted = price_array.sort
  loss_2d_array = Array.new
  for i in 1...price_sorted.length
    high = price_sorted[i]
    low = price_sorted[i - 1]
    loss_2d_array << [
      high - low,
      high.to_s.to_sym,
      low.to_s.to_sym
    ]
  end
  loss_2d_array.sort
end

def find_least_loss(loss, index)
  loss.each do |arr|
    dollar_loss, purchase, sell = arr
    if index[purchase] < index[sell]
      return dollar_loss
    end
  end
end

def minimumLoss(price)
  index_hash = generate_index_hash(price)
  loss_list = generate_loss_list(price)

  find_least_loss(loss_list, index_hash)
end

n = gets.strip.to_i
price = gets.strip
price = price.split(' ').map(&:to_i)
result = minimumLoss(price)
puts result

