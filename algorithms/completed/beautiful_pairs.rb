#https://www.hackerrank.com/challenges/beautiful-pairs/problem
#completed 11/28/17

n = gets.strip.to_i
a = gets.strip.split(' ').map(&:to_i)
b = gets.strip.split(' ').map(&:to_i)

hasha = Hash.new{0}

count = 0
miss = 0
a.each {|x| hasha[x] += 1}
b.each do |x|
    if hasha[x] > 0
        hasha[x] -= 1
        count += 1
    else
        miss += 1
    end
end

if miss > 0
    puts count + 1
else
    puts count - 1
end
