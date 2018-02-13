#!/bin/ruby
#https://www.hackerrank.com/challenges/simple-array-sum/problem
#solved 11/10/17

def simpleArraySum(n, ar)
    ar.inject(:+)
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = simpleArraySum(n, ar)
puts result;
