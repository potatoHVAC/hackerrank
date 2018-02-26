#!/bin/ruby
# https://www.hackerrank.com/contests/rookierank-4/challenges/exam-rush

def examRush(tm, max)
  sorted_times = tm.sort
  total = 0
  completed = 0
  sorted_times.each do |time|
    if total + time > max
      return completed
    else
      total += time
      completed += 1
    end
  end
    
  completed
end

def hackerrank
  n, t = gets.strip.split(' ').map(&:to_i)
  tm = Array.new(n)
  for tm_i in (0..n-1)
    tm[tm_i] = gets.strip.to_i
  end
  result = examRush(tm, t)
  puts result
end

def test
  puts examRush([3,4,51,1,1,1], 5)
  puts examRush([1,1,1,1,1,1,1,1,1,1], 5)
end

test
