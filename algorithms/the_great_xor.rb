#!/bin/ruby
# https://www.hackerrank.com/challenges/the-great-xor/problem
# completed 2/16/18

def theGreatXor(x)
  return 0 if x == 0
  x.to_s(2).gsub('1', 'a').gsub('0','1').gsub('a','0').to_i(2)
end

q = gets.strip.to_i
for a0 in (0..q-1)
    x = gets.strip.to_i
    result = theGreatXor(x)
    puts result;
end
