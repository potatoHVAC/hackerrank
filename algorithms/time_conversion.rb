#!/bin/ruby
# https://www.hackerrank.com/challenges/time-conversion/problem
# completed 2/18/18

def timeConversion(s)
    case s[8,2]
    when "PM"
        if s[0,2] == '12'
            return s[0,8]
        else
            hour = s[0,2].to_i
            hour += 12
            return hour.to_s + s[2,6]
        end
    else
        if s[0,2] == '12'
            return '00' + s[2,6]
        else
            return s[0,8]
        end
    end        
end

s = gets.strip
result = timeConversion(s)
puts result
