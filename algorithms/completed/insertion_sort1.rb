#!/bin/ruby
#https://www.hackerrank.com/challenges/insertionsort1/problem
#completed 2/1/17

def insertionSort1(n, arr)
  element = arr.last
  last_index = arr.length - 1
  last_index.downto(0) do |i|
    if i == 0 || arr[i - 1] <= element
      arr[i] = element
      puts arr * ' '
      break
    else
      arr[i] = arr[i - 1]
      puts arr * ' '
    end
  end
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
insertionSort1(n, arr)
