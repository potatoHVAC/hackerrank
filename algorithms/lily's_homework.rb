#!/bin/ruby
# https://www.hackerrank.com/challenges/lilys-homework/problem
# completed 2/13/18

class Map

  def initialize(arr)
    @arr = arr
    @len = arr.length
    @reverse_arr = arr.reverse
    @arr_hash = index_hash(@arr)
    @reverse_arr_hash = index_hash(@reverse_arr)

    @sorted_arr = arr.sort
  end

  def solve
    first = compare_hashes(@arr, @arr_hash, @sorted_arr)
    second = compare_hashes(@reverse_arr, @reverse_arr_hash, @sorted_arr)
    [first, second].min
  end
  
  def index_hash(arr)
    arr_index = Hash.new
    arr.each_with_index do |num, i|
      arr_index[num] = i
    end

    arr_index
  end

  def compare_hashes(arr, hash, sorted)
    count = 0
    for i in 0...@len
      if arr[i] != sorted[i]
        index_to_swap = hash[sorted[i]]
        hash[arr[i]] = hash[sorted[i]]
        arr[i], arr[index_to_swap] = sorted[i], arr[i]
        
        count += 1
      end
    end

    count
  end
end

def hackerrank
  n = gets.strip.to_i
  arr = gets.strip.split(' ').map(&:to_i)
  hw = Map.new(arr)
  puts hw.solve
end

#hackerrank

#################################################


i = [0,1,2,3,4]
a = [2,3,1]


test = Map.new(a)
puts test.solve
