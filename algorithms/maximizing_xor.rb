#!/bin/ruby
# https://www.hackerrank.com/challenges/maximizing-xor/problem
# completed 2/15/18


def maximizingXor(l, r)
    (l^r).to_s(2).gsub('0','1').to_i(2)
end

l = gets.strip.to_i
r = gets.strip.to_i
result = maximizingXor(l, r)
puts result
