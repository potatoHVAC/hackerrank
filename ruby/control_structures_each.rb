#https://www.hackerrank.com/challenges/ruby-tutorial-each/problem
#completed Oct 2017

def scoring(array)
    # iterate through each of the element in array using *each* and call update_score on it
    array.each {|user| user.update_score}
end
