#!/bin/ruby
#https://www.hackerrank.com/challenges/array-left-rotation/problem
#completed Oct 2017

def leftRotation(a, d)
    new_arr = a.dup
    for i in 0...a.length
        new_arr[i - d] = a[i]
    end
    new_arr
end

n, d = gets.strip.split(' ')
n = n.to_i
d = d.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
result = leftRotation(a, d)
print result.join(" ")


