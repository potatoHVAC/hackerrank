#!/bin/ruby
#https://www.hackerrank.com/challenges/big-sorting/problem
#solved 1/31/18

def bigSorting(arr, low = 0, high = nil)
  if high.nil?
    high = arr.length - 1
  end

  if low >= high
    return arr
  end

  pivot = arr[low]
  min = low
  max = high
  free = min

  while min < max
    if free == min
      if arr[max] <= pivot
        arr[free] = arr[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max
      if arr[min] >= pivot
        arr[free] = arr[min]
        max -= 1
        free = min
      else
        min += 1
      end
    end
  end

  arr[free] = pivot

  bigSorting(arr, low, free - 1)
  bigSorting(arr, free + 1, high)
end



n = gets.strip.to_i
arr = Array.new(n)
for arr_i in (0..n-1)
  arr[arr_i] = gets.strip.to_i
end
result = bigSorting(arr)
print result.join("\n")
