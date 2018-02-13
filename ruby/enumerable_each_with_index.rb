#https://www.hackerrank.com/challenges/ruby-enumerable-each-with-index/problem
#completed Oct 2017

def skip_animals(animals, skip)
    arr = []
    for i in skip...animals.length
        arr << "#{i}:" + animals[i]
    end
    arr
end
