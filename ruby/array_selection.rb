#https://www.hackerrank.com/challenges/ruby-array-selection/problem
#completed Oct 2017

def select_arr(arr)
    arr.select {|x| x%2 != 0}
    # select and return all odd numbers from the Array variable `arr`
end

def reject_arr(arr)
    arr.reject {|x| x%3 == 0}
  # reject all elements which are divisible by 3
end

def delete_arr(arr)
    arr.delete_if {|x| x<0}
  # delete all negative elements
end

def keep_arr(arr)
    arr.keep_if {|x| x >= 0 }
  # keep all non negative elements ( >= 0)
end
