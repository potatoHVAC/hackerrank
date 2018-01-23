
def short_array(arr, value)
  array = arr.dup
  array << value
  array.sort!.index(value)
end

def binary_index_search(arr, value, from = 0, to = nil)
  if to.nil?
    to = arr.count - 1
    if arr.count <= 3
      return short_array(arr,value)
    end
  end

  if from >= (arr.count - 1)
    return -1
  end

  mid = (to + from) / 2

  if arr[mid] < value
    return binary_index_search(arr, value, mid + 1, to)
  elsif arr[mid] > value
    return binary_index_search(arr, value, from, mid - 1)
  else
    return mid
  end
end

def add(value, arr)
  index = binary_index_search(arr, value)
  arr.insert(index, value)
end

a = []
a = add(5,a)
a = add(5,a)
a = add(20,a)
a = add(22,a)
a = add(22,a)
p a
