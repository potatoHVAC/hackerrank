#https://www.hackerrank.com/challenges/security-involution/problem
#completed 11/27/17

x = gets.strip.to_i
y = gets.strip.split(' ').map(&:to_i)

map = {}

for i in 0...x
    map[y[i]] = i + 1
end

test = true

for i in 0...x
    if map[y[i]] != i + 1
        test = false
    end
end

if test == true
    puts "YES"
else puts "NO" end
