#https://www.hackerrank.com/challenges/maximum-perimeter-triangle/submissions/code/60090563
#completed 11/22/17

n = gets.strip.to_i
leg = gets.strip.split(' ').map(&:to_i)
leg.sort!

def triangle(arr)
    longest = arr.pop
    second = arr.pop
    third = arr.pop
    while true
        if longest < second + third
            return "#{third} #{second} #{longest}"
        elsif arr.count > 0
            longest, second, third = second, third, arr.pop
        else
            return -1
        end
    end
end

puts triangle(leg)
