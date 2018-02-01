#https://www.hackerrank.com/challenges/ruby-methods-variable-arguments/problem
#completed Oct 2017

# Your code here
def full_name(first,*rest)
    rest.reduce(first) {|a,b| a+" "+b}
end
