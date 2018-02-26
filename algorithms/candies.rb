#!/bin/ruby
# https://www.hackerrank.com/challenges/candies/problem
# completed 2/24/18

def update_candie(c, child, nc, neighbor)
  if child > neighbor
    [c, nc + 1].max
  else
    c
  end
end

def candies(n, arr)
  candie = Array.new(arr.length, 1)

  1.upto(arr.length - 1) do |i|
    candie[i] = update_candie(candie[i], arr[i], candie[i-1], arr[i-1])
  end

  (arr.length - 2).downto(0) do |i|
    candie[i] = update_candie(candie[i], arr[i], candie[i+ 1], arr[i+1])
  end

  candie.inject(:+)
end

n = gets.strip.to_i
arr = Array.new(n)
for arr_i in (0..n-1)
    arr[arr_i] = gets.strip.to_i
end
result = candies(n, arr)
puts result
