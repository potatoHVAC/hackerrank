#!/bin/ruby
#https://www.hackerrank.com/challenges/30-regex-patterns/problem

N = gets.strip.to_i
gmail = []
for a0 in (0..N-1)
    firstName,emailID = gets.strip.split(' ')
    if emailID.include? "@gmail.com"
        gmail << firstName
    end
end

puts gmail.sort

