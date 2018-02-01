#!/bin/ruby
#https://www.hackerrank.com/challenges/30-sorting/problem

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
# Write Your Code Here

def bubblesort(arr)
    swaps = 0
    check = true
    while check
        newswaps = 0
        for i in 0...arr.count - 1
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                newswaps+=1
            end
        end
        if newswaps == 0
            check = false
        end
        swaps += newswaps
    end
    puts "Array is sorted in #{swaps} swaps."
    puts "First Element: #{arr[0]}"
    puts "Last Element: #{arr[-1]}"
end

bubblesort(a)
    
