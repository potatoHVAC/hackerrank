#https://www.hackerrank.com/challenges/ruby-enumerable-reduce/problem
#completed Oct 2017

def sum_terms(n)
  (1..n).reduce(0) {|s,v| s+= v*v+1}
end

