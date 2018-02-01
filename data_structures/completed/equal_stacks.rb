#!/bin/ruby
#https://www.hackerrank.com/challenges/equal-stacks/problem
#completed Oct 2017

n1,n2,n3 = gets.strip.split(' ')
h1 = gets.strip.split(' ').reverse.map(&:to_i)
h2 = gets.strip.split(' ').reverse.map(&:to_i)
h3 = gets.strip.split(' ').reverse.map(&:to_i)

def create_arr(x)
    arr = []
    sum = 0
    x.each do |y|
        sum += y
        arr << sum.to_s.to_sym
    end
    arr.reverse
end

h1_prog = create_arr(h1)
h2_prog = create_arr(h2)
h3_prog = create_arr(h3)

def map(x)
    map = {}
    x.each {|x| map[x] = x}
    map
end

h2_map = map(h2_prog)
h3_map = map(h3_prog)

def height(x,y,z)
    x.each do |key|
        if y.key?(key) and z.key?(key)
            return key.to_s.to_i
        end
    end
    return 0
end

puts height(h1_prog,h2_map,h3_map)
