#!/bin/ruby
#https://www.hackerrank.com/challenges/quicksort1/problem
#completed 2/1/17

def quickSort(arr)
  left = []
  right = []
  equal = []
  pivot = arr[0]
  arr.each do |ele|
    case ele <=> pivot
    when -1
      left << ele
    when 1
      right << ele
    else
      equal << ele
    end
  end
  [*left + equal + right]
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = quickSort(arr)
print result.join(" ")


