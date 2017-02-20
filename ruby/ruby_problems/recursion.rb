require 'byebug'

def sum_up_to(n)
	return 1 if n == 1
	sum_up_to(n-1) + n
end

puts sum_up_to(88)

def factorial(n)
	return 1 if n == 1
	n * factorial(n-1)
end

puts factorial(4)

def palindrome?(string, n=0)
	return true if string[n..-n-1].length <= 1
	string[n] == string[-n-1] ? palindrome?(string, n+=1) : false
end

def palindrome(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end

puts palindrome?("e")
puts palindrome?("ee")
puts palindrome?("")
puts palindrome?("racecar")
puts palindrome?("thiiht")
puts palindrome?("bottle")
puts palindrome?("thisisinot")
puts palindrome?("abca")
puts "hi"

puts palindrome("e")
puts palindrome("ee")
puts palindrome("")
puts palindrome("racecar")
puts palindrome("thiiht")
puts palindrome("bottle")
puts palindrome?("thisisinot")
puts palindrome?("abca")

def bottles(n)
	if n <= 0
		puts "No more bottles of beer on the wall"
	else
		puts "#{n} bottles of beer on the wall"
		bottles(n-1)
	end
end

bottles(99)

def fib(n)
	return n if n <= 1
	fib(n-1) + fib(n-2)
end

puts fib(6)



def flatten_array(array, flat=[])
	array.each { |x| x.kind_of?(Array) ? flatten_array(x, flat) : flat << x }
	flat
end

print flatten_array([1,4,3,[4,5,[6,6,7],],6])

def flatten(array, result = [])
  array.each do |element|
    if element.kind_of?(Array)
      flatten(element, result)
    else
      result << element
    end
  end 
  result
end


ROMAN_MAPPING = {
	1000 => "M",
	900 => "CM",
	500 => "D",
	400 => "CD",
	100 => "C",
	90 => "XC",
	50 => "L",
	40 => "XL",
	10 => "X",
	9 => "IX",
	5 => "V",
	4 => "IV",
	1 => "I"
}

def integer_roman(integer, roman="")

	ROMAN_MAPPING.each do |number, letter|
		if integer/number >= 1
			roman << letter
			integer_roman((integer-number), roman)
			break
		end
	end
	roman
end

puts integer_roman(1)
puts integer_roman(144)
puts integer_roman(163)
puts integer_roman(1823)

def roman_integer(roman, integer=0)
	return integer if roman == ""

	if (roman.length > 1) && (ROMAN_MAPPING.has_value?(roman[0..1]))
		integer += ROMAN_MAPPING.key(roman[0..1])
		roman_integer(roman[2..-1], integer)
	else
		integer += ROMAN_MAPPING.key(roman[0])
		roman_integer(roman[1..-1], integer)
	end
end

puts roman_integer("CLX")
puts roman_integer("CXL")
puts roman_integer("MDCCCXXIII")
puts roman_integer("I")
puts roman_integer("MCMXCVIII")

def fibi(n)
	array = []
	(0..n).each do |number|
		if number <= 1
			array << number
		else
			x = 0
			y = 1
			(number-1).times do
				x, y = y, (x+y)
			end
			array << y
		end
	end
	return array
end



def fibs_rec(n, arr = [])	
	if arr[n - 1].nil? && n > 0
		if n >= 3
			arr << fibs_rec(n - 1, arr)[n - 2] + fibs_rec(n - 2, arr)[n - 3]
		elsif n == 2
			arr << 0
			arr << 1
		elsif n == 1
			arr << 0
		end
	end	
	arr
end

print fibs_rec(6)
print fibs_rec(0)
print fibs_rec(8)

def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

puts "hi"
#puts fib(6)
#puts fib(0)
#puts fib(8)


def merge_sort(list1=[], list2=[], sorted=[])
	i1 = 1
	i2 = 1
	isorted = 1
	while i1 <= list1.length && i2 <= list2.length
		if list1[0] < list2[0]
			sorted << list1[0]
			i1 +=1
		else
			sorted << list2[0]
			i2 += 1
		end
		isorted += 1
		if i1 == list1.length + 1
	if list1.length >= 1
		first_list = list1.pop(list1.length/2)
		second_list = list1

end

def merge_sort(list1, list2=[], sorted=[])
	if list1.length <= 1
		if list2 == []
			sorted << list1[0]
		else
			sorted << (list1[0] < list2[0] ? [list1[0], list2[0]] : [list2[0], list1[0]])
		end
		return sorted
	end

	first_list = list1.pop(list1.length/2)
	second_list = list1

	iterator1 = merge_sort(first_list).length
	iterator2 = merge_sort(second_list).length

	while i > merge_sort(first_list).length
		if merge_sort(first_list)[0] < merge_sort(second_list)[0]
		 (merge_sort(first_list)[0] : merge_sort(second_list)[0])





	merge_sort(first_list)[0] < merge_sort(second_list)[0]
		sorted <<

	result << (merge_sort(first_list)[0] < merge_sort(second_list)[0] ? (merge_sort(first_list)[0] : merge_sort(second_list)[0])


	merge_sort(first_list) #= [3, 6]
	merge_sort(second_list) #= [3, 8]

	sorted << (merge_sort(first_list)[0] < merge_sort(second_list)[0] ? merge_sort(first_list)[0] : merge_sort(second_list)[0])

	sorted

end


puts merge_sort([3,6,8,3,9,1,3])

=begin

def fib(n)
	return n if n <= 1
	fib(n-1) + fib(n-2)
end

puts fib(6)




roman_mapping2 = {
	1000 => "M",
	900 => "CM",
	500 => "D",
	400 => "CD",
	100 => "C",
	90 => "XC",
	50 => "L",
	40 => "XL",
	10 => "X",
	9 => "IX",
	5 => "V",
	4 => "IV",
	1 => "I"
}

def integer_to_roman2(roman_mapping2, number, result = "")
  return result if number == 0
  roman_mapping2.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping2[divisor] * quotient
    return integer_to_roman2(roman_mapping2, modulus, result) if quotient > 0
  end
end

puts integer_to_roman2(roman_mapping2, 144)
puts integer_to_roman2(roman_mapping2, 163)
puts integer_to_roman2(roman_mapping2, 1823)


roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_integer(roman_mapping, str, result = 0)
  return result if str.empty?
  roman_mapping.keys.each do |roman|
    if str.start_with?(roman)
      result += roman_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_integer(roman_mapping, str, result)
    end
  end
end

puts roman_to_integer(roman_mapping, "CLX")
puts roman_to_integer(roman_mapping, "CXL")
puts roman_to_integer(roman_mapping, "MDCCCXXIII")
puts roman_to_integer(roman_mapping, "I")
puts roman_to_integer(roman_mapping, "MCMXCVIII")


def append2(array, n)
	return array if n < 0
	array << n
	append2(array, n-1)
end


def reverse_append2(array, n)
	return array if n < 0
	reverse_append(array, n-1)
	array << n
	array
end

#This one is BAD
def append(array, n)
	return 0 if n == 0
	array += [n, append(array, n-1)]
	return array.flatten
end

print append([], 9) # => [2,1,0]





print append2([], 9)

#This one is BAD
def reverse_append(array, n)
	return array if n < 0
	array.unshift(n)
	reverse_append(array, n-1)
end

print reverse_append([], 5)
=end
