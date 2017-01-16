def number_to_english number
	if number < 0
		return "Give me a positive number"
	end
	if number == 0
		return "zero"
	end

	number_string = ""

	ones = ["one","two","three","four","five","six","seven","eight","nine"]

	teens = ["eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]

	tens = ["ten","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]



	remaining = number

	write = remaining/1000000000
	remaining = remaining - write*1000000000

	if write > 0
		billions = number_to_english write
		number_string = number_string + billions + " billion"

		if remaining > 0
			number_string = number_string + " "
		end
	end

	write = remaining/100000
	remaining = remaining - write*100000

	if write > 0
		millions = number_to_english write
		number_string = number_string + millions + " million"

		if remaining > 0
			number_string = number_string + " "
		end
	end

	write = remaining/1000
	remaining = remaining - write*1000

	if write > 0
		thousands = number_to_english write
		number_string = number_string + thousands + " thousand"

		if remaining > 0
			number_string = number_string + " "
		end
	end

	write = remaining/100
	remaining = remaining - write*100

	if write > 0
		hundreds = number_to_english write
		number_string = number_string + hundreds + " hundred"

		if remaining > 0
			number_string = number_string + " and "
		end
	end

	write = remaining/10
	remaining = remaining - write*10

	if write > 0
		if ((write == 1) and (remaining > 0))
			number_string = number_string + teens[remaining-1]

			remaining = 0
		else
			number_string = number_string + tens[write-1]
		end

		if remaining > 0
			number_string = number_string + "-"
		end
	end

	write = remaining
	remaining = 0

	if write > 0
		number_string = number_string + ones[write-1]
	end

	number_string
	
end

puts number_to_english(0)

puts number_to_english(12)

puts number_to_english(77)

puts number_to_english(373)


puts "How many bottles of beer on the wall?"

bottles = gets.chomp.to_i

while bottles > 0
	puts (number_to_english bottles) + " bottles of beer on the wall"
	bottles = bottles - 1
end

