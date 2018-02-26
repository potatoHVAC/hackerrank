#!/bin/ruby
# https://www.hackerrank.com/challenges/sum-vs-xor/problem
# completed 2/16/18

def solve(n)
  return 1 if n==0
  2**(n.to_s(2).count('0'))
end

n = gets.strip.to_i
result = solve(n)
puts result;
