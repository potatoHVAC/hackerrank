#!/bin/ruby
#https://www.hackerrank.com/challenges/30-arrays/problem
#completed Oct 2017

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
print arr.reverse.join(' ')
