#!/bin/ruby
# https://www.hackerrank.com/challenges/fibonacci-modified/problem
# completed 2/24/18

def fibonacciModified(t1, t2, n, i = 1)
  return t1 if n == i

  fibonacciModified(t2, t1 + t2**2, n, i + 1)
end

t1, t2, n = gets.strip.split(' ')
t1 = t1.to_i
t2 = t2.to_i
n = n.to_i
result = fibonacciModified(t1, t2, n)
puts result
