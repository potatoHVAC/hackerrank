#https://www.hackerrank.com/challenges/ruby-strings-methods-i/problem
#completed Oct 2017

# Enter your code here. Read input from STDIN. Print output to 

def process_text(arr)
    thing = ""
    arr.each {|x| thing += x.strip + " "}
    return thing.strip
end
