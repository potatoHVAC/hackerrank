#!/bin/ruby
#https://www.hackerrank.com/challenges/fraudulent-activity-notifications/problem
#started on 2/9/18 completed on 2/11/18

class Count_sort
  
  attr_accessor :list, :min, :max, :index_list, :size, :len, :median_index
  def initialize(list, length)
    @list = list
    @min = list.min
    @max = list.max
    @size = max - min + 1
    @len = length
    @median_index = len / 2

    populate_index
  end

  def update(new, old)
    if new == old
      return
    elsif new > old
      if new > max
        extend_left(new)
      end
    else
      if new < min
        extend_right(new)
      end
    end
    
    update_index(new, old)
  end

  def update_index(new, old)
    if new < old
      for i in (new - min)...(old - min)
        @index_list[i] += 1
      end
    else
      for i in (old - min)...(new - min)
        @index_list[i] -= 1
      end
    end
  end
  
  def extend_left(new)
    num = new - max
    @size += num
    @max = new
    @index_list.concat( Array.new(num, @index_list.last) )
  end

  def extend_right(new)
    num = min - new
    @size += num
    @min = new
    @index_list = Array.new(num, -1).concat(@index_list)
  end

  def list_extend_high(new)
    number = new - max
  end
  
  def populate_index
    @index_list = Array.new(size, 0)
    
    @list.each { |n| @index_list[n - min] += 1 }

    count = -1
    @index_list.map! do |n|
      count += n
      n = count
    end
  end
  
  def median
    if size == 1
      list.first
    elsif @len % 2 == 0
      median_even
    else
      median_odd
    end
  end

  def binary_search(index = median_index, low = 0, hi = index_list.length - 1)
    mid = (hi + low) / 2

    current = index_list[mid]
    nxt = index_list[mid + 1]
    previous = index_list[mid - 1]
    
    if mid <= 0
      return 0
    elsif current == index && previous < index
      return mid
    elsif current < index && nxt > index
      return mid + 1
    elsif current < index
      return binary_search(index, mid + 1, hi)
    else
      return binary_search(index, low, mid - 1)
    end
  end
  
  def median_even
    first = binary_search(median_index - 1) + min
    sec = binary_search + min

    (first + sec).to_f / 2
  end

  def median_odd
    binary_search + min
  end
end

def activityNotifications(arr, d, n = arr.length)
  notifications = 0
  sorted_list = Count_sort.new(arr[0, d], d)

  for i in d...n
    if arr[i] >= sorted_list.median * 2
      notifications += 1
    end
    sorted_list.update(arr[i], arr[i - d]) if i < n - 1
  end
  notifications
end

def hackerrank
  n, d = gets.strip.split(' ')
  n = n.to_i
  d = d.to_i
  expenditure = gets.strip
  expenditure = expenditure.split(' ').map(&:to_i)
  result = activityNotifications(expenditure, d, n)
  puts result
end


############################################################################################

def test(arr)
  count = Count_sort.new(arr, arr.length)

  puts "test: #{arr.join(' ')}"
  puts "count arr #{count.index_list.join(' ')}"  if count.index_list.length < 15
  puts "median: #{count.median}"
  puts ''
end

# test([1,2,3])
# test([2,3,4,5])
# test([3,3,3,3])
# test([1])
# test([3,2,1])
# test([4,4,5,6,6])
# test([1,1,1,1,8,8,8,8,8,8,8,8])
# test([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,200])
# test([645,2,6,543,6,37,37,345,77])
# test([2,6,6,37,37,77,77,78,78])
# test([1234,12,3412,341,234,123,41,32,423,41,3241,324,123,42,34,324,132,41,431,234,14,321,1])

def test2(arr, new, old)
  count = Count_sort.new(arr, arr.length)

  puts "test: #{arr}, new: #{new}, old: #{old}"
  puts "Index #{count.index_list.join(' ')}"

  count.update(new,old)

  puts "updated: #{count.index_list.join(' ')}"
  puts ''
end

# test2([3,4,5,6,7], 9, 3)
# test2([4,5,6], 1,5)
# test2([4,4,4,4,4,4,4], 1,4)

def test3(arr, d)
  puts "test: #{arr.join(' ')}"
  puts "notifications: #{activityNotifications(arr, d, arr.length)}"
  puts ''
end


arr = [2,3,4,2,3,6,8,4,5]
n = arr.length
d = 5
notifications = 0
sorted_list = Count_sort.new(arr[0, d], d)

for i in d...n
  if arr[i] >= sorted_list.median * 2
    notifications += 1
  end
  sorted_list.update(arr[i], arr[i - d]) if i < n - 1
end
p notifications
