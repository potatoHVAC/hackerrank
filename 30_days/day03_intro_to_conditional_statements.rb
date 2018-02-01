#!/bin/ruby
#https://www.hackerrank.com/challenges/30-conditional-statements/problem
#completed Oct 2017

N = gets.strip.to_i

if N%2 == 0 and (N == 2 or N == 4 or N > 20)
    puts "Not Weird"
else
    puts "Weird"
end
