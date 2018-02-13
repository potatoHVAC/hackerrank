#!/bin/ruby
#https://www.hackerrank.com/challenges/a-very-big-sum/problem
#solved 11/10/17

def aVeryBigSum(n, ar)
    ar.inject(:+)# Complete this function
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = aVeryBigSum(n, ar)
puts result;
