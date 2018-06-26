def shuffle_sort_count(arr)
  index = 1
  count = 0

  while index < arr.length
    if arr[index] < arr[index - 1]
      arr[index], arr[index - 1] = arr[index - 1], arr[index]
      count += 1
      index -= 1 unless index == 1
    else
      index += 1
    end
  end

  count
end

