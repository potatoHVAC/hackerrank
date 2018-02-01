#https://www.hackerrank.com/challenges/30-review-loop/problem
#completed Oct 2017

# Enter your code here. Read input from STDIN. Print output to STDOUT

i = gets.to_i

for j in 1..i
    x = gets.chomp
    even = ""
    odd = ""
    for k in 0...x.length
        if k%2 == 0
            even << x[k]
        else
            odd << x[k]
        end
    end
    puts even + " " + odd
end

