# https://www.hackerrank.com/challenges/components-in-graph/problem
# completed 3/9/18

class Links

  attr_accessor :data, :count, :touch
  def initialize(a, b)
    @data = [a,b]
    @count = 2
  end

  def add(a)
    @data << a
    @count += 1
  end

  def include(links)
    @data = @data + links.data
    @count += links.count
  end
end

class Map

  def initialize(n)
    @min = n + 1
    @max = 0
    @list = Array.new(n*2 + 1)
  end

  def insert(a,b)
    if @list[a].nil? && @list[b].nil?
      new_link(a,b)
    elsif @list[b].nil?
      add_link(a,b)
    elsif @list[a].nil?
      add_link(b,a)
    elsif @list[a] != @list[b]
      merge_links(a,b)
    end
  end

  def new_link(a,b)
    @list[a] = @list[b] = Links.new(a,b)
  end

  def add_link(a,b)
    @list[a].add(b)
    @list[b] = @list[a]
  end

  def merge_links(a,b)
    a, b = b, a if @list[b].count > @list[a].count
    @list[a].include(@list[b])
    index_list = @list[b].data
    index_list.each { |i| @list[i] = @list[a] }
  end

  def answer
    @list.each do |link|
      if link && link.touch.nil?
        link.touch = true
        @max = link.count if link.count > @max
        @min = link.count if link.count < @min
      end
    end

    [@min, @max].join(' ')
  end        
end

def hackerrank
  n = gets.strip.to_i
  root = Map.new(n)
  
  n.times do
    a, b = gets.strip.split(' ').map(&:to_i)
    root.insert(a,b)
  end

  puts root.answer
end
    
