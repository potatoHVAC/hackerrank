#!/bin/ruby
#https://www.hackerrank.com/challenges/tutorial-intro/submissions/code/64674612
#completed 1/31/18


def introTutorial(v, arr)
    arr.index(v)
end

v = gets.strip.to_i
n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = introTutorial(v, arr)
puts result
