#https://www.hackerrank.com/challenges/angry-children/problem
#solved 12/23/17

n = gets.to_i
k = gets.to_i
candy = Array.new(n)
for i in 0..n-1
      candy[i] = gets.to_i
end

candy.sort!

smallest = nil
stop_index = n - k
for i in 0..stop_index
    check = candy[i + k - 1] - candy[i]
    if smallest.nil?
        smallest = check
    elsif smallest > check
        smallest = check
    end
end

puts smallest
    
