#https://www.hackerrank.com/challenges/ruby-tutorial-unless/problem
#completed Oct 2017

def scoring(array)
  # update_score of every user in the array unless the user is admin
  array.each {|x| x.update_score unless x.is_admin?}
end

