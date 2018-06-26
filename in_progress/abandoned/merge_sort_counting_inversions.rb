class Array

  def counted_merge_sort(check = false,
                         arr = self,
                         temp = self.dup,
                         left_start = 0,
                         right_end = self.length - 1)
    return arr if left_start >= right_end

    middle = (left_start + right_end) / 2

    arr = counted_merge_sort(check, arr, temp, left_start, middle)
    arr = counted_merge_sort(check, arr, temp, middle + 1, right_end)

    merge(check, arr, temp, left_start, right_end)
  end

  def merge(check, arr, temp, left, right_end)
    left_end = (left + right_end) / 2
    right = left_end + 1
    index = left

    while left <= left_end && right <= right_end
      if arr[left] <= arr[right]
        temp[index] = arr[left]
        left += 1
      else
        temp[index] = arr[right]
        @count += right - index if check
        right += 1
      end

      index += 1
    end

    if left <= left_end
      temp[index, left_end - left + 1] = arr[left..left_end]
    else
      temp[index, right_end - right + 1] = arr[right..right_end]
    end

    arr = temp.dup
  end

  def solve
    @count = 0
    self.counted_merge_sort(true)
    @count
  end
end
