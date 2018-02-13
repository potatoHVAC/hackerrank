#!/bin/ruby
#https://www.hackerrank.com/challenges/diagonal-difference/problem
#solved 11/10/17

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end

p_diag = 0
s_diag = 0

for i in 0...n
    p_diag += a[i][i]
    s_diag += a[n - 1 - i][i]
end

puts (p_diag - s_diag).abs
