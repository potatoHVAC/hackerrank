#!/bin/ruby

class Array

  def merge_sort(check = false, arr = self)
    return arr if arr.length <= 1

    middle = arr.length / 2
    left = merge_sort(check, arr[0, middle])
    right = merge_sort(check, arr[middle, arr.length - 1])

    merge(check, left, right)
  end

  def merge(check, left, right)
    sorted = Array.new(left.length + right.length)
    index = 0
    
    while left.any? && right.any?
      if left.first <= right.first
        sorted[index] = left.shift
      else
        sorted[index] = right.shift
        @count += left.length if check
      end

      index += 1
    end

    while left.any? || right.any?
      sorted[index] = left.shift if left.any?
      sorted[index] = right.shift if right.any?
      index += 1
    end

    sorted
  end

  def solve
    @count = 0
    self.merge_sort(true)
    @count
  end
end
