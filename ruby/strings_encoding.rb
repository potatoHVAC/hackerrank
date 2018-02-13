#https://www.hackerrank.com/challenges/ruby-strings-encoding/problem
#completed Oct 2017

# Enter your code here. 
def transcode(x)
    return x.encode("iso-8859-1").force_encoding("utf-8")
end
