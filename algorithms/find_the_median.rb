#!/bin/ruby
#https://www.hackerrank.com/challenges/find-the-median/problem
#completed 2/1/17

def partition(arr, low, high)
  pivot = arr[high]
  i = low - 1
  for j in low...high
    if arr[j] < pivot
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
  end
  if arr[high] < arr[i + 1]
    arr[i + 1], arr[high] = arr[high], arr[i + 1]
  end
  return i + 1
end

def binary_sort(arr, low = 0, high = nil)
  if high.nil?
    high = arr.length - 1
  end

  if low < high
    p = partition(arr, low, high)
    binary_sort(arr, low, p - 1)
    binary_sort(arr, p + 1, high)
  end
  arr
end
  
def find_median(arr)
  arr = binary_sort(arr)
end

n = gets
arr = gets.strip.split(' ').map(&:to_i)
puts find_median(arr)[arr.length / 2]

