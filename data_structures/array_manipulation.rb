#!/bin/ruby
#https://www.hackerrank.com/challenges/crush/problem
#completed Oct 2017

n, m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
max = 0
list = Array.new(n,0)
for a0 in (0..m-1)
  a, b, k = gets.strip.split(' ')
  a = a.to_i
  b = b.to_i
  k = k.to_i
  list[a - 1] += k
  list[b] -= k unless b >= n
end

temp = 0
max = list[0]
list.each do |x|
  temp += x
  max = temp if temp > max
end
p max
