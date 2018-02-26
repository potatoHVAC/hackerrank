a = 0

while a < 3
  puts "a = #{a}"
  for i in 0..5
    if i == 2
      puts 'hi'
      break
    end
    puts "i = #{i}"
  end
  a += 1
end
