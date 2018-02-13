#!/bin/ruby
#https://www.hackerrank.com/challenges/insertionsort2/problem
#completed 2/1/18

def index_for_insert(element, arr)
  arr.each_with_index { |num,i| if element <= num then return i end}
  -1
end

def show(sorted, arr)
  puts [*sorted + arr].join(' ')
end

def insertionSort2(arr)
  sorted = [arr.shift]
  while arr.any?
    next_num = arr.shift
    index = index_for_insert(next_num, sorted)
    sorted.insert(index, next_num)

    show(sorted, arr)
  end    
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
insertionSort2(arr)
