#!/bin/ruby
# https://www.hackerrank.com/challenges/maxsubarray/problem
# completed 2/24/18

def max_subarray(arr)
  max_current = arr[0]
  max_history = arr[0]
  
  arr[1..-1].each do |num|
    max_current = [num, num + max_current].max
    max_history = [max_current, max_history].max
  end  
  
  max_history
end

def main(arr)
  pos_sum = arr.reject { |n| n <= 0 }.inject(:+)
  pos_sum = arr.max if pos_sum.nil?
  
  max_sub = max_subarray(arr)
  
  [max_sub, pos_sum]
end

def hackerrank
  t = gets.strip.to_i
  for a0 in (0..t-1)
    n = gets.strip.to_i
    arr = gets.strip.split(' ').map(&:to_i)
    result = main(arr)
    puts result.join(" ")
  end
end

def test
  p main([1])
  p main([-1, -2, -3])
  p main( [1, -2] )
  p main ([-10])
end

test
g
