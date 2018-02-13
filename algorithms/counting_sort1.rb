#!/bin/ruby
#https://www.hackerrank.com/challenges/countingsort1/problem
#completed 2/1/18

def countingSort(arr)
  answer = Array.new(100,0)
  arr.each { |num| answer[num] += 1 }
  answer
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = countingSort(arr)
print result.join(" ")


