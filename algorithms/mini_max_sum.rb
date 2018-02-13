#!/bin/ruby
#https://www.hackerrank.com/challenges/mini-max-sum/problem
#solved 1/30/18

def miniMaxSum(arr)
    [arr.sort[0,4].inject(:+), arr.sort.reverse[0,4].inject(:+)].join(' ')
end

arr = gets.strip
arr = arr.split(' ').map(&:to_i)
puts miniMaxSum(arr)
