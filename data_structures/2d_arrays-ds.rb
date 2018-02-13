#!/bin/ruby
#https://www.hackerrank.com/challenges/2d-array/problem
#completed Oct 2017

arr = Array.new(6)
for arr_i in (0..6-1)
    arr_t = gets.strip
    arr[arr_i] = arr_t.split(' ').map(&:to_i)
end

max = nil
for x in 0..3
    for y in 0..3
        hourglass = arr[y][x] + arr[y][x+1] + arr[y][x+2] + arr[y+1][x+1] + arr[y+2][x] + arr[y+2][x+1] + arr[y+2][x+2]
        if max == nil || hourglass > max
            max = hourglass
        end
    end
end
puts max
        
