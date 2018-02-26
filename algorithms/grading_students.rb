#!/bin/ruby
# https://www.hackerrank.com/challenges/grading/problem
# completed 2/25/18

def solve(grades)
  grades.map do |grade|
    if grade > 37 && grade % 5 > 2
      grade += 5 - grade % 5
    else
      grade
    end
  end
end

n = gets.strip.to_i
grades = Array.new(n)
for grades_i in (0..n-1)
  grades[grades_i] = gets.strip.to_i
end
result = solve(grades)
print result.join("\n")


