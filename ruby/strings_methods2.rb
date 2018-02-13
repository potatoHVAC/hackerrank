#https://www.hackerrank.com/challenges/ruby-strings-methods-ii/problem
#completed Oct 2017

# Enter your code here

def mask_article(str,arr)
    arr.each {|x| str = str.gsub(x, "<strike>" + x + "</strike>")}
    str
end

def strike(str)
    return "<strike>" + str + "</strike>"
end

