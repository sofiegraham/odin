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


def merging(left=[], right=[], sorted=[])
	i_left = 0
	i_right = 0
	i_sorted = 0
	while (i_left < left.length) && (i_right < right.length)
		if left[i_left] < right[i_right]
			sorted << left[i_left]
			i_left +=1
		else
			sorted << right[i_right]
			i_right += 1
		end
		i_sorted += 1
	end
	if i_left == left.length
		while i_right < right.length
			sorted << right[i_right]
			i_right += 1
		end
	elsif i_right == right.length
		while i_left < left.length
			sorted << left[i_left]
			i_left += 1
		end
	end
	sorted
end

def sorting(list=[])
	#byebug
	if list.length <= 1
		return list
	else
		first_list = list[0..((list.length/2)-1)]
		second_list = list[(list.length/2)..-1]

		return merging(sorting(first_list), sorting(second_list))
	end

end

print merging([6,1,8,4,6,9,4,9,8])




=begin

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


# This is a good merge sort
def merge_sort(ary = [])
	return ary if ary.size == 1

	## Divide
	a1 = ary[0...ary.size/2]
	a2 = ary[ary.size/2..-1]

	## Conquer
	a1 = merge_sort(a1)
	a2 = merge_sort(a2)

	## Merge
	result = []
	idx1, idx2 = 0, 0

	while result.size < (a1.size + a2.size)
		if idx1 == a1.size
			(result << a2[idx2..-1]).flatten!
		elsif idx2 == a2.size
			(result << a1[idx1..-1]).flatten!
		elsif a1[idx1] <= a2[idx2]
			result << a1[idx1]
			idx1 += 1
		else
			result << a2[idx2]
			idx2 += 1
		end
	end

	return result
end
		
a = [1, 3, 2, 10, -9, 12, 4, 3, 2, 4, 1223, 44, 9, 12, 8]
p merge_sort(a)


=end
