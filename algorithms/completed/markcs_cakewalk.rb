#!/bin/ruby
#https://www.hackerrank.com/challenges/marcs-cakewalk/problem
#completed 11/29/17

n = gets.strip.to_i
calories = gets.strip
calories = calories.split(' ').map(&:to_i)
# your code goes here

def shortest_run(cal)
    cal.sort!.reverse!
    miles = 0
    for i in 0...cal.count
        miles += cal[i] * 2**i
    end
    miles
end

p shortest_run(calories)
