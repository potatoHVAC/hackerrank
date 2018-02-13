#https://www.hackerrank.com/challenges/security-inverse-of-a-function/problem
#completed 11/27/17

x = gets.strip.to_i
y = gets.strip.split(' ').map(&:to_i)
y_hash = Hash.new{0}
for i in 1..y.length
    y_hash[y[i - 1]] = i
end
for i in 1..x
    p y_hash[i]
end
