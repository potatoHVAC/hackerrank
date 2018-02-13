#https://www.hackerrank.com/challenges/ruby-array-deletion/problem
#completed Oct 2017

def end_arr_delete(arr)
    arr.pop
    # delete the element from the end of the array and return the deleted element
    
end

def start_arr_delete(arr)
    arr.shift
    
    # delete the element at the beginning of the array and return the deleted element
    
end

def delete_at_arr(arr, index)
    arr.delete_at(index)
    # delete the element at the position #index
    
end

def delete_all(arr, val)
    arr.delete(val)
    # delete all the elements of the array where element = val
    
end
