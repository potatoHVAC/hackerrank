#https://www.hackerrank.com/challenges/ruby-hash-method-each/problem
#completed Oct 2017

def iter_hash(hash)
    hash.each do |x|
        puts x[0]
        puts x[1]
    end
end
