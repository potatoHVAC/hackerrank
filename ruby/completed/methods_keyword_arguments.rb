#https://www.hackerrank.com/challenges/ruby-methods-keyword-arguments/problem
#completed Oct 2017


def convert_temp(temp, input_scale: 'celsius' , output_scale: 'celsius')
  temp = temp.to_f
  if input_scale == output_scale
    return temp
  elsif input_scale == 'celsius' && output_scale == 'fahrenheit'
    return 32 + temp*9/5
  elsif input_scale == 'celsius' && output_scale == 'kelvin'
    return temp + 273.15
  elsif input_scale == 'fahrenheit' && output_scale == 'celsius'
    return (temp - 32)*5/9
  elsif input_scale == 'fahrenheit' && output_scale == 'kelvin'
    return (temp + 459.67)*5/9
  elsif input_scale == 'kelvin' && output_scale == 'celsius'
    return temp - 273.15
  elsif input_scale == 'kelvin' && output_scale == 'fahrenheit'
    return temp*9/5 - 459.67
  else return "I don't know those units!!!"
  end
end
