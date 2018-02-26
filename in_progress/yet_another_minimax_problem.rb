#!/bin/ruby
# https://www.hackerrank.com/challenges/yet-another-minimax-problem/problem
# 

def remove_leading(set)
  max = set[0].length

  set.each do |num|
    if num.length != max || num == '0'
      return set
    end
  end

  set.each do |num|
    ones = num.match(/^1+/)[0].length
    max = ones if max > ones
  end

  set.map{ |num| num[max..-1] }
end

def zero_set(set)
  ans = []

  set.each do |num|
    if
    end
  end
end
  

def anotherMinimaxProblem(a)
  binary_num = a.map{|num| num.to_s(2)}

  sub_set = remove_leading(binary_num).map{ |num| num.to_i(2) }


  sub_set.min ^ zero_set.max
end

def hackerrank
  n = gets.strip.to_i
  a = gets.strip
  a = a.split(' ').map(&:to_i)
  result = anotherMinimaxProblem(a)
  puts result
end

def test1
  puts anotherMinimaxProblem([1,2,3])
end

def rl
  puts remove_leading(["11001", "11011", "11111"]).join(', ')
  puts remove_leading(["1", "111"]).join(', ')
  puts remove_leading(["1", "0"]).join(', ')
  puts remove_leading(["111", "111"]).join(', ')
end      

ans = 151
set = [77, 49, 90, 110, 69, 63, 4, 249, 244, 245]

puts anotherMinimaxProblem(set)
puts  a = set.map{ |num| num.to_s(2)}
puts ''
puts remove_leading(a)
