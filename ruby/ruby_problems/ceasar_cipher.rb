def ceasar_cipher(string, number)
	letters = string.split("")
	letters.each_with_index do |item, index|
		if letters[index].match(/\b[A-Z]/)
			letters[index] = letters[index].ord+number
			if letters[index] > 90
				letters[index] = letters[index]-26
			end
		elsif letters[index].match(/\b[a-z]/)
			letters[index] = letters[index].ord+number
			if letters[index] > 122
				letters[index] = letters[index]-26
			end
		end
		letters[index] = letters[index].chr
	end

	return letters.join
end

puts ceasar_cipher("Zhis is the string!", 5)