#https://www.hackerrank.com/challenges/equal/problem
#completed Oct 2017

tests = gets.strip.to_i

def div_rem(x,y)
    return [x / y, x % y]
end

def steps(start,target)
    diff = start - target
    count5 = div_rem(diff,5)
    count2 = div_rem(count5[1],2)
    count1 = div_rem(count2[1],1)
    return count5[0] + count2[0] + count1[0]
end

for i in 0...tests
    people = gets.strip.to_i
    choco_hash = Hash.new{0}
    min = nil
    chocolate = gets.strip.split(' ').each do |x|
        choco_hash[x.to_sym] += 1
        if min == nil || x.to_i < min
            min = x.to_i
        end
    end
 
    steps = 0
    
    choco_hash.each do |x,y|
        steps += y * steps(x.to_s.to_i,min)
    end
    
    min -= 1
    steps_check1 = 0
    choco_hash.each do |x,y|
        steps_check1 += y * steps(x.to_s.to_i,min)
    end
    
    
    min -= 1
    steps_check2 = 0
    choco_hash.each do |x,y|
        steps_check2 += y * steps(x.to_s.to_i,min)
    end
    
    answer = [steps, steps_check1, steps_check2].sort
    p answer[0]
end
