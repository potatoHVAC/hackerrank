#!/bin/ruby
#https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array/problem
#completed 11/19/17

def minimumAbsoluteDifference(n, arr)
    # Complete this function
    arr.sort!
    min = nil
    for i in 0...(arr.count - 1)
        diff = arr[i+1] - arr[i]
        if min.nil? || diff < min
            min = diff
        end
    end
    min
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = minimumAbsoluteDifference(n, arr)
puts result
