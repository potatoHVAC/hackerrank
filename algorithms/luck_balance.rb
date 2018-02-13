#!/bin/ruby
#https://www.hackerrank.com/challenges/luck-balance/problem
#completed 11/18/17

n, k = gets.strip.split(' ').map(&:to_i)

important = []
dive = [0]

n.times do
    round = gets.strip.split(' ').map(&:to_i)
    if round[1] == 0
        dive << round[0]
    else
        important << round[0]
    end
end

important.sort!.reverse!
total = dive.inject(:+)

for i in 0...important.count
    if i < k
        total += important[i]
    else
        total -= important[i]
    end
end

puts total
