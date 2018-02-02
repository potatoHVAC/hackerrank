#!/bin/ruby
#https://www.hackerrank.com/challenges/closest-numbers/problem
#completed 2/1/17
#times out on test 4 because insertion sort is not efficient enough. 

def index_for_insert(element, arr)
  arr.each_with_index { |num,i| if element <= num then return i end}
  -1
end

def insertionSort2(arr)
  sorted = [arr.shift]
  while arr.any?
    next_num = arr.shift
    index = index_for_insert(next_num, sorted)
    sorted.insert(index, next_num)
  end
  sorted
end

def closestNumbers(arr)
  sorted = insertionSort2(arr)
  min = nil
  difference = {}
  for i in 1...sorted.length
    diff = sorted[i] - sorted[i -  1]
    key = diff.to_s.to_sym
    if min.nil?
      min = diff
    elsif min > diff
      min = diff
    end

    if difference[key].nil?
      difference[key] = []
    end
    
    difference[key] << sorted[i - 1]
    difference[key] << sorted[i]
  end
  difference[min.to_s.to_sym]
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = closestNumbers(arr)
print result.join(" ")


