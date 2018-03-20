# https://www.hackerrank.com/challenges/components-in-graph/problem
# 

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
    @list = Array.new(n + 1)
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

  def query(a)
    if @list[a].nil?
      1
    else
      @list[a].count
    end
  end
end

def hackerrank
  n, m = gets.strip.split(' ').map(&:to_i)
  root = Map.new(n)

  m.times do
    input = gets.strip.split(' ')
    case input[0]
    when 'Q'
      puts root.query(input[1].to_i)
    else
      root.insert(input[1].to_i, input[2].to_i)
    end
  end
end
    
