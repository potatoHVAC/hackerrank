#!/bin/ruby
#https://www.hackerrank.com/challenges/staircase/problem
#solved 1/30/18

def staircase(n)
  1.upto(n){ |i| puts " " * (n - i) + "#" * i }
end

n = gets.strip.to_i
staircase(n)
