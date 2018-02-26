#!/bin/ruby
# https://www.hackerrank.com/challenges/flipping-bits/problem
# completed 2/16/18

def flippingBits(n)
    n.to_s(2).rjust(32, '0').gsub('1', 'a').gsub('0', '1').gsub('a', '0').to_i(2)
end

t = gets.strip.to_i
for a0 in (0..t-1)
    n = gets.strip.to_i
    result = flippingBits(n)
    puts result
end
