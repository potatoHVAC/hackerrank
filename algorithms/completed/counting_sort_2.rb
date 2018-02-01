#https://www.hackerrank.com/challenges/countingsort2/problem
#completed 11/27/17

size = gets.strip.to_i
list = gets.strip.split(' ').map(&:to_i)
puts list.sort.join(' ')

