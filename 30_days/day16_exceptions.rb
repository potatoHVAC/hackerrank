#!/bin/ruby
#https://www.hackerrank.com/challenges/30-exceptions-string-to-integer/problem

S = gets.strip

begin
  puts Integer(S)
rescue
  puts "Bad String"
end
