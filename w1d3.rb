def sum_to(num)
  return 1 if num == 1
  return nil if num < 1
  num + sum_to(num -1)
end

def add_numbers(array)
  return nil if array.empty?
  return array[0] if array.length == 1
  array[0] + add_numbers(array[1..-1])
end

def factorial(i)
  return 1 if i == 1
  i * factorial(i-1)
end

def gamma_func(n)
  return nil if n < 1
  return 1 if n == 1
   (n-1)*factorial(n-2)
end

def ice_cream_shop(array, guess)
  return nil if array.empty?
  return array[0] == guess if array.length == 1
  array[0] == guess || ice_cream_shop(array[1..-1], guess)
end

def reverse(string)
  return nil if string.empty?
  return string[0] if string.length == 1
  reverse(string[1..-1]) + string[0]
end
