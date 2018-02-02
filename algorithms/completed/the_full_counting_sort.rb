#!/bin/ruby
#https://www.hackerrank.com/challenges/countingsort4/problem
#completed 2/1/18

def collect(arr2d)
  collector = []
  100.times { collector << []}
  arr2d.each { |set| collector[set[0]] << set[1]}
  collector.reject { |x| x.empty? }
end

n = gets.strip.to_i
arr2d = []
for a0 in (0..n-1)
  x, s = gets.strip.split(' ')
  x = x.to_i
  if a0 < n/2
    arr2d << [x, '-']
  else
    arr2d << [x, s]
  end
end

puts collect(arr2d).join(' ')
