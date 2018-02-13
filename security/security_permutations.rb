#https://www.hackerrank.com/challenges/security-tutorial-permutations/problem
#completed 11/27/17


x = gets.strip.to_i
y = gets.strip.split(' ').map(&:to_i)

map = {}

for i in 0...x
    map[i + 1] = y[i]
end

y.each {|k| p map[k]}
