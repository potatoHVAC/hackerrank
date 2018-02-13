#https://www.hackerrank.com/challenges/ruby-strings-introduction/problem
#completed Oct 2017

def single_quote
  return 'Hello World and others!'       # single quote string here
  
end

def double_quote
  return "Hello World and others!"# Double quote string here
end

def here_doc
  words = <<-Potato
Hello World and others!
Potato
    
return words


# Here doc string here
end
