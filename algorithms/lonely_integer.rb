#!/bin/ruby
# https://www.hackerrank.com/challenges/lonely-integer/problem
# completed 2/15/18

def lonelyinteger(a)
    a.inject(:^)
end

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
result = lonelyinteger(a)
puts result;
