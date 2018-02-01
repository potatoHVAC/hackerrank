#https://www.hackerrank.com/challenges/ruby-methods-introduction/problem
#completed Oct 2017

# Your code here

def prime?(num)
    i = 2
    if num == 1
        return false
    end
    while i < num**0.5
        if num % i == 0
            return false
        end
        i += 1
    end
    return true
end
