#https://www.hackerrank.com/challenges/ruby-enumerable-any-all-none-find/problem
#completed Oct 2017

def func_any(hash)
  hash.any? {|x,y| x.is_a? Integer}
  # Check and return true if any key object within the hash is of the type Integer
  # If not found, return false.
end

def func_all(hash)
  hash.all? {|x,y| y.is_a? Integer and y < 10}
  # Check and return true if all the values within the hash are Integers and are < 10
  # If not all values satisfy this, return false.
end

def func_none(hash)
  hash.none? {|x,y| y.nil?}
  # Check and return true if none of the values within the hash are nil
  # If any value contains nil, return false.
end

def func_find(hash)
  if hash.find {|x,y| x.is_a? Integer and y.is_a? Integer and y < 20}
    return hash.find {|x,y| x.is_a? Integer and y.is_a? Integer and y < 20}
  elsif hash.find {|x,y| x.is_a? String and y.is_a? String and y[0] == 'a'}
    return hash.find {|x,y| x.is_a? String and y.is_a? String and y[0] == 'a'}
    
  end
  # Check and return the first object that satisfies either of the following properties:
  #   1. There is a [key, value] pair where the key and value are both Integers and the value is < 20 
  #   2. There is a [key, value] pair where the key and value are both Strings and the value starts with `a`.
end
