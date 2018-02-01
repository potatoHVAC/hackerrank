#https://www.hackerrank.com/challenges/security-bijective-functions/problem
#completed 11/27/17

hash = Hash.new{0}

n = gets.strip.to_i
y = gets.strip.split(' ')
y.each {|x| hash[x.to_sym] += 1}

if hash.length == n
    puts "YES"
else
    puts "NO"
end

