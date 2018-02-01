#!/bin/ruby
#https://www.hackerrank.com/challenges/minimum-distances/problem
#completed 11/28/17

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

hash = Hash.new{}

shortest_answer = -1
for i in 0...a.count
  if hash[a[i]].nil?
    hash[a[i]] = []
  end
  hash[a[i]] << i
end

def shortest(arr)
  answer = nil
  for i in 0...arr.count - 1
    diff = arr[i + 1] - arr[i]
    if answer.nil? || diff < answer
      answer = diff
    end
  end
  return answer
end

hash.each do |k,v|
  if v.count > 1
    check = shortest(v)
    if shortest_answer == -1 || check < shortest_answer
      shortest_answer = check
    end
  end
end

puts shortest_answer
