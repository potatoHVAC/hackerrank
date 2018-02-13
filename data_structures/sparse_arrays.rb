#https://www.hackerrank.com/challenges/sparse-arrays/problem
#completed Oct 2017

str_count = gets.strip.to_i
str = Hash.new{0}
for i in 0...str_count
  string = gets.strip.to_sym
  str[string] +=1
end

queries = gets.strip.to_i
for i in 0...queries
  string_key = gets.strip.to_sym
  puts str[string_key]
end
